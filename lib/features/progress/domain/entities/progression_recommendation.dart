enum ProgressionType { maintain, increaseWeight, increaseReps, decreaseWeight, decreaseReps }

class ProgressionRecommendation {
  final ProgressionType type;
  final double? suggestedWeight;
  final int? suggestedReps;
  final String reasoning;

  const ProgressionRecommendation({required this.type, this.suggestedWeight, this.suggestedReps, required this.reasoning});
}
