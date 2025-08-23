import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifter/app/app.dart';
import 'package:lifter/features/progress/progress.dart';
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

          return Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome to Lifter', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: AppSpacing.lg),

                // Quick Actions
                Card(
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

                const SizedBox(height: AppSpacing.lg),

                // Suggested Workout Plans
                Text('Suggested Workout Plans', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSpacing.sm),

                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildWorkoutPlanCard(
                        context,
                        'Strength Training',
                        '5x5 compound movements for maximum strength gains',
                        Icons.fitness_center,
                        Colors.blue,
                        () => _showWorkoutPlanOptions(context, 'Strength'),
                      ),
                      _buildWorkoutPlanCard(
                        context,
                        'Hypertrophy',
                        'High volume training for muscle growth',
                        Icons.trending_up,
                        Colors.green,
                        () => _showWorkoutPlanOptions(context, 'Hypertrophy'),
                      ),
                      _buildWorkoutPlanCard(
                        context,
                        'Endurance',
                        'High rep training for stamina and endurance',
                        Icons.timer,
                        Colors.orange,
                        () => _showWorkoutPlanOptions(context, 'Endurance'),
                      ),
                      _buildWorkoutPlanCard(
                        context,
                        'Powerlifting',
                        'Maximal strength with heavy compound lifts',
                        Icons.whatshot,
                        Colors.red,
                        () => _showWorkoutPlanOptions(context, 'Powerlifting'),
                      ),
                      _buildWorkoutPlanCard(
                        context,
                        'Bodybuilding',
                        'Aesthetic focus with isolation movements',
                        Icons.self_improvement,
                        Colors.purple,
                        () => _showWorkoutPlanOptions(context, 'Bodybuilding'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                // Recent Workouts
                Text('Recent Workouts', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSpacing.sm),

                if (state.workouts.isEmpty)
                  const Card(
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
            ),
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

  Widget _buildWorkoutPlanCard(BuildContext context, String title, String description, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(right: AppSpacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: AppSpacing.sm),
              Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: AppSpacing.xs),
              Text(description, style: Theme.of(context).textTheme.bodySmall, maxLines: 3, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }

  void _showWorkoutPlanOptions(BuildContext context, String planType) {
    showModalBottomSheet(context: context, builder: (context) => _buildWorkoutPlanOptions(context, planType));
  }

  Widget _buildWorkoutPlanOptions(BuildContext context, String planType) {
    final muscleGroups = [
      {'name': 'Chest', 'icon': Icons.fitness_center},
      {'name': 'Back', 'icon': Icons.accessibility_new},
      {'name': 'Legs', 'icon': Icons.directions_run},
      {'name': 'Shoulders', 'icon': Icons.accessibility},
      {'name': 'Arms', 'icon': Icons.fitness_center},
      {'name': 'Core', 'icon': Icons.center_focus_strong},
      {'name': 'Full Body', 'icon': Icons.all_inclusive},
    ];

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose Target Muscle Group', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.md),
          Text('Select a muscle group for your $planType workout plan', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.lg),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppSpacing.sm,
                mainAxisSpacing: AppSpacing.sm,
                childAspectRatio: 1.5,
              ),
              itemCount: muscleGroups.length,
              itemBuilder: (context, index) {
                final muscleGroup = muscleGroups[index];
                final muscleGroupName = muscleGroup['name'] as String;
                final muscleGroupIcon = muscleGroup['icon'] as IconData;
                return Card(
                  child: InkWell(
                    onTap: () => _generateWorkoutPlan(context, planType, muscleGroupName),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(muscleGroupIcon, size: 24, color: Theme.of(context).colorScheme.primary),
                          const SizedBox(height: AppSpacing.xs),
                          Text(muscleGroupName, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _generateWorkoutPlan(BuildContext context, String planType, String muscleGroup) {
    // Close the bottom sheet
    Navigator.of(context).pop();

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => const AlertDialog(
            content: Row(children: [CircularProgressIndicator(), SizedBox(width: AppSpacing.md), Text('Generating your workout plan...')]),
          ),
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
        workoutDuration: 60, // Default duration
        availableExerciseIds: List.generate(100, (index) => index + 1), // Example exercise IDs
        userWeight: 75.0, // Default weight
        userExperienceLevel: 3, // Default experience level
      );

      // Generate workout plan using repository
      final workoutPlan = await cubit.generateWorkoutPlan(request: request);

      // Close loading dialog
      if (context.mounted) {
        Navigator.of(context).pop();
        // Show the generated workout plan
        _showGeneratedWorkoutPlan(context, workoutPlan);
      }
    } catch (e) {
      // Close loading dialog
      if (context.mounted) {
        Navigator.of(context).pop();
        // Show error dialog
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Error'),
                content: Text('Failed to generate workout plan: $e'),
                actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
              ),
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
      builder:
          (context) => AlertDialog(
            title: Text(workoutPlan.name),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(workoutPlan.description, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: AppSpacing.sm),
                  Text('Duration: ${workoutPlan.totalDuration} minutes', style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: AppSpacing.md),
                  Text('Exercises:', style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: AppSpacing.xs),
                  ...workoutPlan.exercises.map(
                    (exercise) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                      child: Text(
                        '• ${exercise.exerciseName}: ${exercise.sets}x${exercise.reps} (${exercise.restSeconds}s rest)',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  if (workoutPlan.notes != null) ...[
                    const SizedBox(height: AppSpacing.md),
                    Text('Notes:', style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: AppSpacing.xs),
                    Text(workoutPlan.notes!, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close')),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // TODO: Navigate to workout plan details or start workout
                  _startWorkout(context, workoutPlan);
                },
                child: const Text('Start Workout'),
              ),
            ],
          ),
    );
  }

  void _startWorkout(BuildContext context, WorkoutPlan workoutPlan) {
    // TODO: Implement workout start functionality
    // This could navigate to a workout session screen
    // or save the plan to the database
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Starting ${workoutPlan.name}...'), duration: const Duration(seconds: 2)));
  }
}
