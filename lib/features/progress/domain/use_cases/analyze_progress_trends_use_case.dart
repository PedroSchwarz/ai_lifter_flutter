import 'package:lifter/app/app.dart';
import 'package:lifter/features/progress/domain/entities/progress_trend.dart';

/// Use case for analyzing overall progress trends across exercises
class AnalyzeProgressTrendsUseCase {
  /// Analyzes overall progress trends for all exercises
  List<ExerciseProgress> call({required List<WorkoutSet> allSets}) {
    if (allSets.isEmpty) {
      return [];
    }

    // Group by exercise
    final exerciseGroups = <int, List<WorkoutSet>>{};
    for (final workoutSet in allSets) {
      exerciseGroups.putIfAbsent(workoutSet.exerciseId, () => []).add(workoutSet);
    }

    final progressList = <ExerciseProgress>[];

    for (final entry in exerciseGroups.entries) {
      final exerciseId = entry.key;
      final sets = entry.value;

      // Sort by date
      sets.sort((a, b) => a.createdAt.compareTo(b.createdAt));

      // Calculate progress over time
      final recentSets = sets.take(5).toList();
      final olderSets = sets.length > 5 ? sets.take(sets.length - 5).toList() : <WorkoutSet>[];

      if (recentSets.isNotEmpty && olderSets.isNotEmpty) {
        final recentAvgWeight = recentSets.map((s) => s.weight).reduce((a, b) => a + b) / recentSets.length;
        final olderAvgWeight = olderSets.map((s) => s.weight).reduce((a, b) => a + b) / olderSets.length;

        final weightProgress = ((recentAvgWeight - olderAvgWeight) / olderAvgWeight) * 100;

        final trend =
            weightProgress > 0
                ? ProgressTrend.improving
                : weightProgress < 0
                ? ProgressTrend.declining
                : ProgressTrend.stable;

        progressList.add(
          ExerciseProgress(
            exerciseId: exerciseId,
            weightProgressPercentage: weightProgress,
            trend: trend,
            recentAvgWeight: recentAvgWeight,
            olderAvgWeight: olderAvgWeight,
          ),
        );
      }
    }

    return progressList;
  }
}
