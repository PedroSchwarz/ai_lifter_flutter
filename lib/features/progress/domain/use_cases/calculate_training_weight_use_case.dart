/// Use case for calculating training weight based on one-rep max and target reps
class CalculateTrainingWeightUseCase {
  /// Calculates training weight based on one-rep max and target reps using reverse Epley formula
  /// Formula: weight = 1RM / (1 + reps/30)
  double call({required double oneRepMax, required int targetReps}) {
    return oneRepMax / (1 + targetReps / 30);
  }
}
