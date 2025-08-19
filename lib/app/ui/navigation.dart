import 'package:go_router/go_router.dart';
import 'package:lifter/features/exercises/ui/exercises_screen.dart';
import 'package:lifter/features/progress/ui/progress_screen.dart';
import 'package:lifter/features/workouts/ui/workouts_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/${WorkoutsScreen.routeName}',
  routes: [
    GoRoute(path: '/${WorkoutsScreen.routeName}', name: WorkoutsScreen.routeName, builder: (context, state) => const WorkoutsScreen()),
    GoRoute(path: '/${ExercisesScreen.routeName}', name: ExercisesScreen.routeName, builder: (context, state) => const ExercisesScreen()),
    GoRoute(path: '/${ProgressScreen.routeName}', name: ProgressScreen.routeName, builder: (context, state) => const ProgressScreen()),
  ],
);
