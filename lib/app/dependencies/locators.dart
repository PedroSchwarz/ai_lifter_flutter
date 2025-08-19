import 'package:get_it/get_it.dart';
import 'package:lifter/app/app.dart';
import 'package:lifter/features/progress/progress.dart';
import 'package:lifter/features/workouts/workouts.dart';
import 'package:meta/meta.dart';

final getIt = GetIt.instance;

abstract class BaseServiceLocator {
  BuildConfiguration get buildConfiguration;

  @mustCallSuper
  Future<void> setup();
}

class Locator extends BaseServiceLocator {
  @override
  BuildConfiguration get buildConfiguration => const BuildConfiguration(environment: Environment.development);

  @override
  Future<void> setup() async {
    // Register build configuration
    getIt.registerSingleton<BuildConfiguration>(buildConfiguration);

    // Register database
    getIt.registerSingleton<AppDatabase>(AppDatabase());

    // Register managers
    getIt.registerSingleton<ExercisesManager>(ExercisesManager(database: getIt()));
    getIt.registerSingleton<WorkoutSetsManager>(WorkoutSetsManager(database: getIt()));
    getIt.registerSingleton<WorkoutsManager>(WorkoutsManager(database: getIt()));

    // Register use cases
    getIt.registerSingleton<AnalyzeProgressionUseCase>(AnalyzeProgressionUseCase());
    getIt.registerSingleton<CalculateOneRepMaxUseCase>(CalculateOneRepMaxUseCase());
    getIt.registerSingleton<CalculateTrainingWeightUseCase>(CalculateTrainingWeightUseCase());
    getIt.registerSingleton<AnalyzeProgressTrendsUseCase>(AnalyzeProgressTrendsUseCase());

    // Register progression algorithm
    getIt.registerSingleton<ProgressionAlgorithmUseCase>(
      ProgressionAlgorithmUseCase(
        analyzeProgressionUseCase: getIt(),
        calculateOneRepMaxUseCase: getIt(),
        calculateTrainingWeightUseCase: getIt(),
        analyzeProgressTrendsUseCase: getIt(),
      ),
    );

    // Register repositories
    getIt.registerSingleton<WorkoutsRepository>(
      WorkoutsRepository(exercisesManager: getIt(), workoutsManager: getIt(), workoutSetsManager: getIt(), progressionAlgorithm: getIt()),
    );

    // Register cubits
    getIt.registerFactory<WorkoutsCubit>(() => WorkoutsCubit(repository: getIt()));
  }
}
