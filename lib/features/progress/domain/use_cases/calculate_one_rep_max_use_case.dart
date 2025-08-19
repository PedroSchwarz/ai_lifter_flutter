/// Use case for calculating estimated one-rep max based on weight and reps
class CalculateOneRepMaxUseCase {
  /// Calculates estimated one-rep max based on weight and reps using Epley formula
  /// Formula: 1RM = weight × (1 + reps/30)
  double call({required double weight, required int reps}) {
    return weight * (1 + reps / 30);
  }
}
