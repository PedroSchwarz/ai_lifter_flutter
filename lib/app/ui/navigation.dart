import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:lifter/features/exercises/ui/exercises_screen.dart';
import 'package:lifter/features/progress/progress.dart';
import 'package:lifter/features/workout_session/workout_session.dart';
import 'package:lifter/features/workouts/workouts.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/${WorkoutsScreen.routeName}',
  routes: [
    GoRoute(
      path: '/${WorkoutsScreen.routeName}',
      name: WorkoutsScreen.routeName,
      builder: (context, state) => const WorkoutsScreen(),
      routes: [
        GoRoute(
          path: '/${WorkoutSessionScreen.routeName}',
          name: WorkoutSessionScreen.routeName,
          builder: (context, state) {
            final json = state.uri.queryParameters['workout_plan'] ?? '{}';

            final workoutPlan = WorkoutPlan.fromJson(jsonDecode(json));

            return WorkoutSessionScreen(workoutPlan: workoutPlan);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/${ProgressionRecommendationsScreen.routeName}',
      name: ProgressionRecommendationsScreen.routeName,
      builder: (context, state) {
        final recommendationsJson = state.uri.queryParameters['recommendations'] ?? '{}';
        final performanceSummariesJson = state.uri.queryParameters['performance_summaries'] ?? '{}';

        final recommendations = Map<int, ProgressionRecommendation>.from(
          jsonDecode(recommendationsJson).map((key, value) => MapEntry(int.parse(key), ProgressionRecommendation.fromJson(value))),
        );

        final performanceSummaries = Map<int, ExercisePerformanceSummary>.from(
          jsonDecode(performanceSummariesJson).map((key, value) => MapEntry(int.parse(key), ExercisePerformanceSummary.fromJson(value))),
        );

        return ProgressionRecommendationsScreen(recommendations: recommendations, performanceSummaries: performanceSummaries);
      },
    ),
    GoRoute(path: '/${ExercisesScreen.routeName}', name: ExercisesScreen.routeName, builder: (context, state) => const ExercisesScreen()),
    GoRoute(path: '/${ProgressScreen.routeName}', name: ProgressScreen.routeName, builder: (context, state) => const ProgressScreen()),
  ],
);
