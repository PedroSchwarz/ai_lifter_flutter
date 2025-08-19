import 'package:lifter/app/app.dart';
import 'package:lifter/features/progress/domain/entities/progression_recommendation.dart';

/// Use case for analyzing recent performance and recommending the next progression
class AnalyzeProgressionUseCase {
  static const int _targetReps = 8;
  static const double _weightIncreasePercentage = 0.05; // 5%
  static const double _weightDecreasePercentage = 0.10; // 10%
  static const int _minRepsForWeightIncrease = 6;
  static const int _maxRepsForWeightIncrease = 12;
  static const int _minRepsForRepIncrease = 8;
  static const int _maxRepsForRepIncrease = 15;

  /// Analyzes recent performance and recommends the next progression
  ProgressionRecommendation call({required List<WorkoutSet> recentSets, required double currentWeight, required int currentReps}) {
    if (recentSets.isEmpty) {
      return const ProgressionRecommendation(
        type: ProgressionType.maintain,
        reasoning: 'No previous data available. Start with current weight and reps.',
      );
    }

    // Get the last 3 workouts for this exercise
    final recentWorkouts = recentSets.take(9).toList();

    // Calculate average performance
    final avgWeight = recentWorkouts.map((s) => s.weight).reduce((a, b) => a + b) / recentWorkouts.length;
    final avgReps = recentWorkouts.map((s) => s.reps).reduce((a, b) => a + b) / recentWorkouts.length;

    // Check if consistently hitting target reps
    final consistentReps = recentWorkouts.every((s) => s.reps >= _minRepsForWeightIncrease);

    // Check if weight has been stable
    final weightStable = (avgWeight - currentWeight).abs() < 0.5; // Within 0.5kg

    // Analyze RPE if available
    final rpeData = recentWorkouts.where((s) => s.rpe != null).toList();
    final avgRPE = rpeData.isNotEmpty ? rpeData.map((s) => s.rpe!).reduce((a, b) => a + b) / rpeData.length : null;

    // Decision logic
    if (consistentReps && weightStable && avgReps >= _minRepsForWeightIncrease) {
      // Ready for weight increase
      final newWeight = currentWeight * (1 + _weightIncreasePercentage);
      return ProgressionRecommendation(
        type: ProgressionType.increaseWeight,
        suggestedWeight: newWeight,
        suggestedReps: _targetReps,
        reasoning: 'Consistently hitting target reps with stable weight. Ready for weight increase.',
      );
    } else if (avgReps >= _maxRepsForWeightIncrease && weightStable) {
      // Too many reps, increase weight
      final newWeight = currentWeight * (1 + _weightIncreasePercentage);
      return ProgressionRecommendation(
        type: ProgressionType.increaseWeight,
        suggestedWeight: newWeight,
        suggestedReps: _targetReps,
        reasoning: 'Hitting too many reps consistently. Increasing weight to maintain proper intensity.',
      );
    } else if (avgReps < _minRepsForWeightIncrease && avgRPE != null && avgRPE > 8) {
      // Struggling with current weight
      final newWeight = currentWeight * (1 - _weightDecreasePercentage);
      return ProgressionRecommendation(
        type: ProgressionType.decreaseWeight,
        suggestedWeight: newWeight,
        suggestedReps: _targetReps,
        reasoning: 'Struggling with current weight (high RPE, low reps). Decreasing weight to maintain proper form.',
      );
    } else if (avgReps >= _minRepsForRepIncrease && avgReps < _maxRepsForRepIncrease) {
      // Good weight, can increase reps
      final newReps = currentReps + 1;
      return ProgressionRecommendation(
        type: ProgressionType.increaseReps,
        suggestedReps: newReps,
        reasoning: 'Good weight management. Increasing reps to build endurance.',
      );
    } else if (avgReps > _maxRepsForRepIncrease) {
      // Too many reps, increase weight
      final newWeight = currentWeight * (1 + _weightIncreasePercentage);
      return ProgressionRecommendation(
        type: ProgressionType.increaseWeight,
        suggestedWeight: newWeight,
        suggestedReps: _targetReps,
        reasoning: 'Too many reps being performed. Increasing weight to maintain proper training intensity.',
      );
    } else {
      // Maintain current parameters
      return const ProgressionRecommendation(
        type: ProgressionType.maintain,
        reasoning: 'Current weight and reps are appropriate. Continue with current parameters.',
      );
    }
  }
}
