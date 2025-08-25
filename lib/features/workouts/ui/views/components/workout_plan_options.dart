import 'package:flutter/material.dart';
import 'package:lifter/app/app.dart';

class WorkoutPlanOptions extends StatelessWidget {
  final String planType;
  final Function(String) onMuscleGroupSelected;

  const WorkoutPlanOptions({super.key, required this.planType, required this.onMuscleGroupSelected});

  @override
  Widget build(BuildContext context) {
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
                    onTap: () => onMuscleGroupSelected(muscleGroupName),
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
}
