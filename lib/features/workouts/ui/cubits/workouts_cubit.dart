import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifter/app/app.dart';
import 'package:lifter/features/progress/progress.dart';
import 'package:lifter/features/workouts/workouts.dart';

part 'workouts_cubit.freezed.dart';

class WorkoutsCubit extends Cubit<WorkoutsState> {
  @visibleForTesting
  final WorkoutsRepository repository;

  WorkoutsCubit({required this.repository}) : super(const WorkoutsState(exercises: [], workouts: [], currentWorkoutSets: [], isLoading: true));

  // Exercise methods
  Future<void> loadExercises() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final exercises = await repository.getAllExercises();
      emit(state.copyWith(exercises: exercises, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> createExercise({required String name, required String category, required String muscleGroup, String? description}) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await repository.createExercise(name: name, category: category, muscleGroup: muscleGroup, description: description);
      await loadExercises();
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> updateExercise({
    required int id,
    required String name,
    required String category,
    required String muscleGroup,
    String? description,
  }) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await repository.updateExercise(id: id, name: name, category: category, muscleGroup: muscleGroup, description: description);
      await loadExercises();
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> deleteExercise(int id) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await repository.deleteExercise(id);
      await loadExercises();
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  // Workout methods
  Future<void> loadWorkouts() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final workouts = await repository.getAllWorkouts();
      emit(state.copyWith(workouts: workouts, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> createWorkout({required String name, required DateTime date, String? notes}) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await repository.createWorkout(name: name, date: date, notes: notes);
      await loadWorkouts();
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> updateWorkout({required int id, required String name, required DateTime date, String? notes}) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await repository.updateWorkout(id: id, name: name, date: date, notes: notes);
      await loadWorkouts();
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> deleteWorkout(int id) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await repository.deleteWorkout(id);
      await loadWorkouts();
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  // Set methods
  Future<void> loadWorkoutSets(int workoutId) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final sets = await repository.getSetsWithExerciseForWorkout(workoutId);
      emit(state.copyWith(currentWorkoutSets: sets, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> createSet({
    required int workoutId,
    required int exerciseId,
    required double weight,
    required int reps,
    int? rpe,
    bool isWarmup = false,
  }) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await repository.createSet(workoutId: workoutId, exerciseId: exerciseId, weight: weight, reps: reps, rpe: rpe, isWarmup: isWarmup);
      await loadWorkoutSets(workoutId);
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> updateSet({required int id, required double weight, required int reps, int? rpe, bool isWarmup = false}) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await repository.updateSet(id: id, weight: weight, reps: reps, rpe: rpe, isWarmup: isWarmup);
      if (state.selectedWorkout != null) {
        await loadWorkoutSets(state.selectedWorkout!.id);
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> deleteSet(int id) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await repository.deleteSet(id);
      if (state.selectedWorkout != null) {
        await loadWorkoutSets(state.selectedWorkout!.id);
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  // Selection methods
  void selectWorkout(Workout workout) {
    emit(state.copyWith(selectedWorkout: workout));
    loadWorkoutSets(workout.id);
  }

  void selectExercise(Exercise exercise) {
    emit(state.copyWith(selectedExercise: exercise));
  }

  void clearSelection() {
    emit(state.copyWith(selectedWorkout: null, selectedExercise: null, currentWorkoutSets: []));
  }

  // Progression methods
  Future<ProgressionRecommendation?> getProgressionRecommendation({
    required int exerciseId,
    required double currentWeight,
    required int currentReps,
  }) async {
    try {
      return await repository.getProgressionRecommendation(exerciseId: exerciseId, currentWeight: currentWeight, currentReps: currentReps);
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
      return null;
    }
  }

  // Workout plan generation
  Future<WorkoutPlan> generateWorkoutPlan({required WorkoutPlanRequest request}) async {
    try {
      return await repository.generateWorkoutPlan(request: request);
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
      rethrow;
    }
  }
}

@freezed
class WorkoutsState with _$WorkoutsState {
  const factory WorkoutsState({
    required List<Exercise> exercises,
    required List<Workout> workouts,
    required List<SetWithExercise> currentWorkoutSets,
    required bool isLoading,
    String? error,
    Workout? selectedWorkout,
    Exercise? selectedExercise,
  }) = _WorkoutsState;

  const WorkoutsState._();

  // State getters
  bool get isEmpty => exercises.isEmpty && workouts.isEmpty;
  bool get hasExercises => exercises.isNotEmpty;
  bool get hasWorkouts => workouts.isNotEmpty;
  bool get hasCurrentWorkout => selectedWorkout != null;
  bool get hasCurrentWorkoutSets => currentWorkoutSets.isNotEmpty;
  List<Exercise> exercisesByCategory(String category) => exercises.where((e) => e.category == category).toList();
  List<Exercise> exercisesByMuscleGroup(String muscleGroup) => exercises.where((e) => e.muscleGroup == muscleGroup).toList();
}
