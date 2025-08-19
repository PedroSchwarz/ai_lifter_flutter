enum ProgressTrend { improving, declining, stable, noData }

class ExerciseProgress {
  final int exerciseId;
  final double weightProgressPercentage;
  final ProgressTrend trend;
  final double recentAvgWeight;
  final double olderAvgWeight;

  const ExerciseProgress({
    required this.exerciseId,
    required this.weightProgressPercentage,
    required this.trend,
    required this.recentAvgWeight,
    required this.olderAvgWeight,
  });
}
