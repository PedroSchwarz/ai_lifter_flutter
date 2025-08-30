import 'package:lifter/features/progress/progress.dart';
import 'package:lifter/features/workout_session/workout_session.dart';
import 'package:lifter/features/workouts/workouts.dart';

/// Use case for analyzing workout feedback and generating progression recommendations
class AnalyzeWorkoutFeedbackProgressionUseCase {
  static const double _weightIncreasePercentage = 0.05; // 5%
  static const double _weightDecreasePercentage = 0.10; // 10%

  /// Analyzes workout feedback for a specific exercise and generates progression recommendations
  ProgressionRecommendation call({required Set<WorkoutFeedback> workoutFeedbacks, required ExerciseRecommendation exercise}) {
    // Filter feedback for the specific exercise
    final exerciseFeedbacks = workoutFeedbacks.where((feedback) => feedback.exercise.exerciseId == exercise.exerciseId).toList();

    if (exerciseFeedbacks.isEmpty) {
      return const ProgressionRecommendation(
        type: ProgressionType.maintain,
        reasoning: 'No feedback available for this exercise. Continue with current parameters.',
      );
    }

    // Sort feedback by set number to maintain order
    exerciseFeedbacks.sort((a, b) => a.set.compareTo(b.set));

    // Analyze performance patterns
    final performanceAnalysis = _analyzePerformancePatterns(exerciseFeedbacks, exercise);

    // Generate recommendation based on analysis
    return _generateRecommendation(performanceAnalysis, exercise);
  }

  /// Analyzes performance patterns from workout feedback
  PerformanceAnalysis _analyzePerformancePatterns(List<WorkoutFeedback> feedbacks, ExerciseRecommendation exercise) {
    final totalSets = exercise.sets;
    final targetReps = exercise.reps;
    final currentWeight = exercise.weight ?? 0.0;

    // Count performance types
    final underperformedCount = feedbacks.where((f) => f.performance == WorkoutFeedbackPerformance.underperformed).length;
    final performedCount = feedbacks.where((f) => f.performance == WorkoutFeedbackPerformance.performed).length;
    final overperformedCount = feedbacks.where((f) => f.performance == WorkoutFeedbackPerformance.overperformed).length;

    // Calculate performance percentages
    final totalFeedback = feedbacks.length;
    final underperformedPercentage = totalFeedback > 0 ? underperformedCount / totalFeedback : 0.0;
    final performedPercentage = totalFeedback > 0 ? performedCount / totalFeedback : 0.0;
    final overperformedPercentage = totalFeedback > 0 ? overperformedCount / totalFeedback : 0.0;

    // Analyze consistency
    final isConsistent = _calculateConsistency(feedbacks);

    // Analyze progression trend
    final progressionTrend = _analyzeProgressionTrend(feedbacks);

    return PerformanceAnalysis(
      totalSets: totalSets,
      completedSets: totalFeedback,
      targetReps: targetReps,
      currentWeight: currentWeight,
      underperformedCount: underperformedCount,
      performedCount: performedCount,
      overperformedCount: overperformedCount,
      underperformedPercentage: underperformedPercentage,
      performedPercentage: performedPercentage,
      overperformedPercentage: overperformedPercentage,
      isConsistent: isConsistent,
      progressionTrend: progressionTrend,
    );
  }

  /// Calculates consistency of performance across sets
  bool _calculateConsistency(List<WorkoutFeedback> feedbacks) {
    if (feedbacks.length < 2) {
      return true;
    }

    final performances = feedbacks.map((f) => f.performance).toList();
    final firstPerformance = performances.first;

    // Check if all performances are the same (perfect consistency)
    return performances.every((p) => p == firstPerformance);
  }

  /// Analyzes progression trend across sets
  ProgressionTrend _analyzeProgressionTrend(List<WorkoutFeedback> feedbacks) {
    if (feedbacks.length < 2) {
      return ProgressionTrend.stable;
    }

    final performances = feedbacks.map((f) => f.performance).toList();

    // Count improvements and declines
    int improvements = 0;
    int declines = 0;

    for (int i = 1; i < performances.length; i++) {
      final previous = performances[i - 1];
      final current = performances[i];

      if (_isPerformanceImprovement(previous, current)) {
        improvements++;
      } else if (_isPerformanceDecline(previous, current)) {
        declines++;
      }
    }

    if (improvements > declines) {
      return ProgressionTrend.improving;
    } else if (declines > improvements) {
      return ProgressionTrend.declining;
    } else {
      return ProgressionTrend.stable;
    }
  }

  /// Determines if performance improved from previous to current
  bool _isPerformanceImprovement(WorkoutFeedbackPerformance previous, WorkoutFeedbackPerformance current) {
    if (previous == WorkoutFeedbackPerformance.underperformed && current == WorkoutFeedbackPerformance.performed) {
      return true;
    }
    if (previous == WorkoutFeedbackPerformance.underperformed && current == WorkoutFeedbackPerformance.overperformed) {
      return true;
    }
    if (previous == WorkoutFeedbackPerformance.performed && current == WorkoutFeedbackPerformance.overperformed) {
      return true;
    }
    return false;
  }

  /// Determines if performance declined from previous to current
  bool _isPerformanceDecline(WorkoutFeedbackPerformance previous, WorkoutFeedbackPerformance current) {
    if (previous == WorkoutFeedbackPerformance.overperformed && current == WorkoutFeedbackPerformance.performed) {
      return true;
    }
    if (previous == WorkoutFeedbackPerformance.overperformed && current == WorkoutFeedbackPerformance.underperformed) {
      return true;
    }
    if (previous == WorkoutFeedbackPerformance.performed && current == WorkoutFeedbackPerformance.underperformed) {
      return true;
    }
    return false;
  }

  /// Generates progression recommendation based on performance analysis
  ProgressionRecommendation _generateRecommendation(PerformanceAnalysis analysis, ExerciseRecommendation exercise) {
    // Case 1: Mostly underperformed - decrease weight or maintain
    if (analysis.underperformedPercentage >= 0.6) {
      if (analysis.currentWeight > 0) {
        final newWeight = analysis.currentWeight * (1 - _weightDecreasePercentage);
        return ProgressionRecommendation(
          type: ProgressionType.decreaseWeight,
          suggestedWeight: newWeight,
          suggestedReps: analysis.targetReps,
          reasoning: 'Mostly underperformed sets. Decreasing weight to maintain proper form and build confidence.',
        );
      } else {
        return const ProgressionRecommendation(
          type: ProgressionType.maintain,
          reasoning: 'Mostly underperformed sets. Continue with current parameters to build strength.',
        );
      }
    }

    // Case 2: Mostly overperformed - increase weight
    if (analysis.overperformedPercentage >= 0.6) {
      if (analysis.currentWeight > 0) {
        final newWeight = analysis.currentWeight * (1 + _weightIncreasePercentage);
        return ProgressionRecommendation(
          type: ProgressionType.increaseWeight,
          suggestedWeight: newWeight,
          suggestedReps: analysis.targetReps,
          reasoning: 'Mostly overperformed sets. Increasing weight to maintain proper training intensity.',
        );
      } else {
        return ProgressionRecommendation(
          type: ProgressionType.increaseReps,
          suggestedReps: analysis.targetReps + 1,
          reasoning: 'Mostly overperformed sets. Increasing reps to maintain proper training intensity.',
        );
      }
    }

    // Case 3: Mixed performance with consistency
    if (analysis.isConsistent && analysis.performedPercentage >= 0.4) {
      if (analysis.progressionTrend == ProgressionTrend.improving) {
        // Improving trend - can increase weight or reps
        if (analysis.currentWeight > 0) {
          final newWeight = analysis.currentWeight * (1 + _weightIncreasePercentage);
          return ProgressionRecommendation(
            type: ProgressionType.increaseWeight,
            suggestedWeight: newWeight,
            suggestedReps: analysis.targetReps,
            reasoning: 'Consistent performance with improving trend. Ready for weight increase.',
          );
        } else {
          return ProgressionRecommendation(
            type: ProgressionType.increaseReps,
            suggestedReps: analysis.targetReps + 1,
            reasoning: 'Consistent performance with improving trend. Ready for rep increase.',
          );
        }
      } else if (analysis.progressionTrend == ProgressionTrend.declining) {
        // Declining trend - maintain or decrease
        return const ProgressionRecommendation(
          type: ProgressionType.maintain,
          reasoning: 'Consistent performance but declining trend. Maintain current parameters to stabilize.',
        );
      }
    }

    // Case 4: Inconsistent performance
    if (!analysis.isConsistent) {
      return const ProgressionRecommendation(
        type: ProgressionType.maintain,
        reasoning: 'Inconsistent performance across sets. Maintain current parameters to improve consistency.',
      );
    }

    // Case 5: Mostly performed as expected
    if (analysis.performedPercentage >= 0.6) {
      if (analysis.progressionTrend == ProgressionTrend.improving) {
        // Can increase weight or reps
        if (analysis.currentWeight > 0) {
          final newWeight = analysis.currentWeight * (1 + _weightIncreasePercentage);
          return ProgressionRecommendation(
            type: ProgressionType.increaseWeight,
            suggestedWeight: newWeight,
            suggestedReps: analysis.targetReps,
            reasoning: 'Mostly performed as expected with improving trend. Ready for weight increase.',
          );
        } else {
          return ProgressionRecommendation(
            type: ProgressionType.increaseReps,
            suggestedReps: analysis.targetReps + 1,
            reasoning: 'Mostly performed as expected with improving trend. Ready for rep increase.',
          );
        }
      } else {
        return const ProgressionRecommendation(
          type: ProgressionType.maintain,
          reasoning: 'Mostly performed as expected. Current parameters are appropriate.',
        );
      }
    }

    // Default case
    return const ProgressionRecommendation(
      type: ProgressionType.maintain,
      reasoning: 'Mixed performance pattern. Maintain current parameters and focus on consistency.',
    );
  }
}

/// Data class for performance analysis results
class PerformanceAnalysis {
  final int totalSets;
  final int completedSets;
  final int targetReps;
  final double currentWeight;
  final int underperformedCount;
  final int performedCount;
  final int overperformedCount;
  final double underperformedPercentage;
  final double performedPercentage;
  final double overperformedPercentage;
  final bool isConsistent;
  final ProgressionTrend progressionTrend;

  const PerformanceAnalysis({
    required this.totalSets,
    required this.completedSets,
    required this.targetReps,
    required this.currentWeight,
    required this.underperformedCount,
    required this.performedCount,
    required this.overperformedCount,
    required this.underperformedPercentage,
    required this.performedPercentage,
    required this.overperformedPercentage,
    required this.isConsistent,
    required this.progressionTrend,
  });
}

/// Enum for progression trends
enum ProgressionTrend { improving, declining, stable }
