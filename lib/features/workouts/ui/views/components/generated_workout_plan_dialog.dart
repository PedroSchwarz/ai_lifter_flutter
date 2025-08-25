import 'package:flutter/material.dart';
import 'package:lifter/app/app.dart';
import 'package:lifter/features/progress/progress.dart';

class GeneratedWorkoutPlanDialog extends StatelessWidget {
  final WorkoutPlan workoutPlan;
  final VoidCallback onClose;
  final VoidCallback onStartWorkout;

  const GeneratedWorkoutPlanDialog({super.key, required this.workoutPlan, required this.onClose, required this.onStartWorkout});

  @override
  Widget build(BuildContext context) {
    final exercises = workoutPlan.steps.whereType<WorkoutStepExercise>().map((step) => step.exercise).toSet();

    return AlertDialog(
      title: Text(workoutPlan.name),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(workoutPlan.description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: AppSpacing.sm),
            Text('Duration: ${workoutPlan.totalDurationInMinutes} minutes', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: AppSpacing.md),
            Text('Exercises:', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: AppSpacing.xs),
            ...exercises.map(
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
        TextButton(onPressed: onClose, child: const Text('Close')),
        ElevatedButton(onPressed: onStartWorkout, child: const Text('Start Workout')),
      ],
    );
  }
}
