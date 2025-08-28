import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lifter/app/app.dart';
import 'package:lifter/features/workout_session/workout_session.dart';
import 'package:lifter/features/workouts/workouts.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  static const String routeName = 'workouts';

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  final WorkoutsCubit cubit = getIt<WorkoutsCubit>();

  @override
  void initState() {
    super.initState();
    cubit.loadWorkouts();
    cubit.loadExercises();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lifter'), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: BlocBuilder<WorkoutsCubit, WorkoutsState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.error}'),
                  const SizedBox(height: AppSpacing.md),
                  ElevatedButton(
                    onPressed: () {
                      cubit.loadWorkouts();
                      cubit.loadExercises();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(AppSpacing.md),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Text('Welcome to Lifter', style: Theme.of(context).textTheme.headlineMedium),
              ),
              const Gap(AppSpacing.lg),
              // Quick Actions
              Card(
                margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quick Actions', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // TODO: Navigate to create workout
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('New Workout'),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // TODO: Navigate to exercises
                              },
                              icon: const Icon(Icons.fitness_center),
                              label: const Text('Exercises'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const Gap(AppSpacing.lg),

              // Suggested Workout Plans
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Text('Suggested Workout Plans', style: Theme.of(context).textTheme.titleMedium),
              ),
              const Gap(AppSpacing.sm),

              SizedBox(
                height: 232,
                child: ListView(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  scrollDirection: Axis.horizontal,
                  children: [
                    WorkoutPlanCard(
                      title: 'Strength Training',
                      description: '5x5 compound movements for maximum strength gains',
                      icon: Icons.fitness_center,
                      color: Colors.blue,
                      onTap: () => _showWorkoutPlanOptions(context, 'Strength'),
                    ),
                    WorkoutPlanCard(
                      title: 'Hypertrophy',
                      description: 'High volume training for muscle growth',
                      icon: Icons.trending_up,
                      color: Colors.green,
                      onTap: () => _showWorkoutPlanOptions(context, 'Hypertrophy'),
                    ),
                    WorkoutPlanCard(
                      title: 'Endurance',
                      description: 'High rep training for stamina and endurance',
                      icon: Icons.timer,
                      color: Colors.orange,
                      onTap: () => _showWorkoutPlanOptions(context, 'Endurance'),
                    ),
                    WorkoutPlanCard(
                      title: 'Powerlifting',
                      description: 'Maximal strength with heavy compound lifts',
                      icon: Icons.whatshot,
                      color: Colors.red,
                      onTap: () => _showWorkoutPlanOptions(context, 'Powerlifting'),
                    ),
                    WorkoutPlanCard(
                      title: 'Bodybuilding',
                      description: 'Aesthetic focus with isolation movements',
                      icon: Icons.self_improvement,
                      color: Colors.purple,
                      onTap: () => _showWorkoutPlanOptions(context, 'Bodybuilding'),
                    ),
                  ],
                ),
              ),

              const Gap(AppSpacing.lg),

              // Recent Workouts
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Text('Recent Workouts', style: Theme.of(context).textTheme.titleMedium),
              ),
              const Gap(AppSpacing.sm),

              if (state.workouts.isEmpty)
                const Card(
                  margin: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Padding(padding: EdgeInsets.all(AppSpacing.lg), child: Center(child: Text('No workouts yet. Create your first workout!'))),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: state.workouts.length,
                    itemBuilder: (context, index) {
                      final workout = state.workouts[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: ListTile(
                          title: Text(workout.name),
                          subtitle: Text('${workout.date.day}/${workout.date.month}/${workout.date.year}'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            cubit.selectWorkout(workout);
                            // TODO: Navigate to workout details
                          },
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to create workout
        },
        tooltip: 'Add Workout',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showWorkoutPlanOptions(BuildContext context, String planType) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return WorkoutPlanOptions(
          planType: planType,
          onMuscleGroupSelected: (muscleGroup) {
            _generateWorkoutPlan(context, planType, muscleGroup);
          },
        );
      },
    );
  }

  void _generateWorkoutPlan(BuildContext context, String planType, String muscleGroup) {
    // Close the bottom sheet
    context.pop();

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const AlertDialog(
          content: Row(children: [CircularProgressIndicator(), SizedBox(width: AppSpacing.md), Text('Generating your workout plan...')]),
        );
      },
    );

    // Generate the workout plan
    _generateWorkoutPlanAsync(context, planType, muscleGroup);
  }

  Future<void> _generateWorkoutPlanAsync(BuildContext context, String planType, String muscleGroup) async {
    try {
      // Convert plan type and muscle group to enums
      final workoutPlanType = _getWorkoutPlanType(planType);
      final targetMuscleGroup = _getMuscleGroup(muscleGroup);

      // Create workout plan request
      final request = WorkoutPlanRequest(
        planType: workoutPlanType,
        targetMuscleGroup: targetMuscleGroup,
        workoutDurationInMinutes: 60, // Default duration
        availableExerciseIds: List.generate(100, (index) => index + 1), // Example exercise IDs
        userWeight: 75.0, // Default weight
        userExperienceLevel: 3, // Default experience level
      );

      // Generate workout plan using repository
      final workoutPlan = await cubit.generateWorkoutPlan(request: request);

      // Close loading dialog
      if (context.mounted) {
        context.pop();
        // Show the generated workout plan
        _showGeneratedWorkoutPlan(context, workoutPlan);
      }
    } catch (e) {
      // Close loading dialog
      if (context.mounted) {
        context.pop();
        // Show error dialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('Failed to generate workout plan: $e'),
              actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
            );
          },
        );
      }
    }
  }

  WorkoutPlanType _getWorkoutPlanType(String planType) {
    switch (planType.toLowerCase()) {
      case 'strength':
        return WorkoutPlanType.strength;
      case 'hypertrophy':
        return WorkoutPlanType.hypertrophy;
      case 'endurance':
        return WorkoutPlanType.endurance;
      case 'powerlifting':
        return WorkoutPlanType.powerlifting;
      case 'bodybuilding':
        return WorkoutPlanType.bodybuilding;
      default:
        return WorkoutPlanType.strength;
    }
  }

  MuscleGroup _getMuscleGroup(String muscleGroup) {
    switch (muscleGroup.toLowerCase()) {
      case 'chest':
        return MuscleGroup.chest;
      case 'back':
        return MuscleGroup.back;
      case 'legs':
        return MuscleGroup.legs;
      case 'shoulders':
        return MuscleGroup.shoulders;
      case 'arms':
        return MuscleGroup.arms;
      case 'core':
        return MuscleGroup.core;
      case 'full body':
        return MuscleGroup.fullBody;
      default:
        return MuscleGroup.fullBody;
    }
  }

  void _showGeneratedWorkoutPlan(BuildContext context, WorkoutPlan workoutPlan) {
    showDialog(
      context: context,
      builder: (context) {
        return GeneratedWorkoutPlanDialog(
          workoutPlan: workoutPlan,
          onClose: () => context.pop(),
          onStartWorkout: () {
            final _ = context.pop();
            context.goNamed(WorkoutSessionScreen.routeName, queryParameters: {'workout_plan': jsonEncode(workoutPlan.toJson())});
          },
        );
      },
    );
  }
}
