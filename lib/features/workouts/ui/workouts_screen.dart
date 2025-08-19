import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifter/app/app.dart';
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
}
