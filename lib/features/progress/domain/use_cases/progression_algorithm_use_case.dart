import 'package:lifter/app/app.dart';
import 'package:lifter/features/progress/domain/entities/progress_trend.dart';
import 'package:lifter/features/progress/domain/entities/progression_recommendation.dart';
import 'package:lifter/features/progress/domain/use_cases/analyze_progress_trends_use_case.dart';
import 'package:lifter/features/progress/domain/use_cases/analyze_progression_use_case.dart';
import 'package:lifter/features/progress/domain/use_cases/calculate_one_rep_max_use_case.dart';
import 'package:lifter/features/progress/domain/use_cases/calculate_training_weight_use_case.dart';

/// Main use case that orchestrates all progression-related operations
/// This replaces the legacy ProgressionAlgorithm class
class ProgressionAlgorithmUseCase {
  final AnalyzeProgressionUseCase analyzeProgressionUseCase;
  final CalculateOneRepMaxUseCase calculateOneRepMaxUseCase;
  final CalculateTrainingWeightUseCase calculateTrainingWeightUseCase;
  final AnalyzeProgressTrendsUseCase analyzeProgressTrendsUseCase;

  ProgressionAlgorithmUseCase({
    required this.analyzeProgressionUseCase,
    required this.calculateOneRepMaxUseCase,
    required this.calculateTrainingWeightUseCase,
    required this.analyzeProgressTrendsUseCase,
  });

  /// Analyzes recent performance and recommends the next progression
  ProgressionRecommendation analyzeProgression({required List<WorkoutSet> recentSets, required double currentWeight, required int currentReps}) {
    return analyzeProgressionUseCase.call(recentSets: recentSets, currentWeight: currentWeight, currentReps: currentReps);
  }

  /// Calculates estimated one-rep max based on weight and reps
  double calculateOneRepMax({required double weight, required int reps}) {
    return calculateOneRepMaxUseCase.call(weight: weight, reps: reps);
  }

  /// Calculates training weight based on one-rep max and target reps
  double calculateTrainingWeight({required double oneRepMax, required int targetReps}) {
    return calculateTrainingWeightUseCase.call(oneRepMax: oneRepMax, targetReps: targetReps);
  }

  /// Analyzes overall progress trends (returns domain entities)
  List<ExerciseProgress> analyzeProgressTrends({required List<WorkoutSet> allSets}) {
    return analyzeProgressTrendsUseCase.call(allSets: allSets);
  }

  /// Analyzes overall progress trends (legacy method returning Map for backward compatibility)
  Map<String, dynamic> analyzeProgressTrendsAsMap({required List<WorkoutSet> allSets}) {
    final progressList = analyzeProgressTrendsUseCase.call(allSets: allSets);

    if (progressList.isEmpty) {
      return {'trend': 'no_data', 'message': 'No training data available'};
    }

    final trends = <String, dynamic>{};
    for (final progress in progressList) {
      trends[progress.exerciseId.toString()] = {
        'weight_progress_percentage': progress.weightProgressPercentage,
        'trend': progress.trend.name,
        'recent_avg_weight': progress.recentAvgWeight,
        'older_avg_weight': progress.olderAvgWeight,
      };
    }

    return trends;
  }
}
