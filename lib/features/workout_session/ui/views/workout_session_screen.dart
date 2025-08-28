import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lifter/app/dependencies/locators.dart';
import 'package:lifter/app/theming/spacing.dart';
import 'package:lifter/features/workout_session/workout_session.dart';
import 'package:lifter/features/workouts/workouts.dart';

class WorkoutSessionScreen extends StatefulWidget {
  final WorkoutPlan workoutPlan;

  const WorkoutSessionScreen({required this.workoutPlan, super.key});

  static const routeName = 'workout-session';

  @override
  State<WorkoutSessionScreen> createState() => _WorkoutSessionScreenState();
}

class _WorkoutSessionScreenState extends State<WorkoutSessionScreen> {
  final cubit = getIt<WorkoutSessionCubit>();

  @override
  void initState() {
    super.initState();
    cubit.load(workoutPlan: widget.workoutPlan);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
      bloc: cubit,
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        if (state is WorkoutSessionLoaded) {
          return BlocListener(
            bloc: cubit,
            listenWhen: (previous, current) {
              if (current is WorkoutSessionLoaded) {
                return (previous as WorkoutSessionLoaded).hasSessionFinished != current.hasSessionFinished;
              }
              return false;
            },
            listener: (context, state) {
              if (state is WorkoutSessionLoaded && state.hasSessionFinished) {
                _showSessionFinishedDialog();
              }
            },
            child: Scaffold(
              appBar: AppBar(title: Text(state.workoutPlan.name)),
              body: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  children: [
                    BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
                      bloc: cubit,
                      buildWhen: (previous, current) {
                        if (current is WorkoutSessionLoaded) {
                          return previous != current;
                        }
                        return false;
                      },
                      builder: (context, state) {
                        final currentState = state as WorkoutSessionLoaded;
                        final step = currentState.currentStep;
                        final nextExerciseStep = currentState.nextExercise;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (step is WorkoutStepTransition) const Text('Next exercise:'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: AppSpacing.md,
                              children: [
                                Text(_getExerciseDisplayName(step, nextExerciseStep), style: theme.textTheme.titleLarge),
                                Chip(
                                  backgroundColor: theme.colorScheme.inversePrimary,
                                  label: Text(_getExerciseRepsDisplay(step, nextExerciseStep), style: theme.textTheme.bodyLarge),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(_getExerciseTypeDisplay(step, nextExerciseStep).toUpperCase()),
                                if (_hasSuggestedWeight(step, nextExerciseStep))
                                  Text('Suggested Weight of: ${_getSuggestedWeight(step, nextExerciseStep)}kg'),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
                      bloc: cubit,
                      builder: (context, state) {
                        final currentState = state as WorkoutSessionLoaded;
                        final step = currentState.currentStep;

                        return switch (step) {
                          WorkoutStepExercise() => Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Gap(AppSpacing.xl),
                              Text('Set Number ${step.setNumber} of ${step.exercise.sets} Total', style: theme.textTheme.titleLarge),
                              const Gap(AppSpacing.sm),
                              Text('Clean Reps Performed:', style: theme.textTheme.bodyLarge),
                              const Gap(AppSpacing.sm),
                              Wrap(
                                spacing: AppSpacing.sm,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  ChoiceChip(
                                    label: Text('<${step.exercise.reps}'),
                                    selected: cubit.getSetFeedback(set: step.setNumber, performance: WorkoutFeedbackPerformance.underperformed),
                                    onSelected: (_) {
                                      cubit.setSetFeedback(set: step.setNumber, performance: WorkoutFeedbackPerformance.underperformed);
                                    },
                                  ),
                                  ChoiceChip(
                                    label: Text('${step.exercise.reps}'),
                                    selected: cubit.getSetFeedback(set: step.setNumber, performance: WorkoutFeedbackPerformance.performed),
                                    onSelected: (_) {
                                      cubit.setSetFeedback(set: step.setNumber, performance: WorkoutFeedbackPerformance.performed);
                                    },
                                  ),
                                  ChoiceChip(
                                    label: Text('>${step.exercise.reps}'),
                                    selected: cubit.getSetFeedback(set: step.setNumber, performance: WorkoutFeedbackPerformance.overperformed),
                                    onSelected: (_) {
                                      cubit.setSetFeedback(set: step.setNumber, performance: WorkoutFeedbackPerformance.overperformed);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          WorkoutStepTransition() => Expanded(
                            child: Column(
                              children: [
                                const Spacer(),
                                Text('Resting...', style: theme.textTheme.titleLarge),
                                const Gap(AppSpacing.xl),
                                SessionTimer(duration: (step.transition as WorkoutTransitionRest).restDuration, isPaused: state.isRestingPaused),
                                const Spacer(),
                              ],
                            ),
                          ),
                        };
                      },
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                color: theme.scaffoldBackgroundColor,
                child: BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
                  bloc: cubit,
                  buildWhen: (previous, current) {
                    if (current is WorkoutSessionLoaded) {
                      return previous != current;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    final currentState = state as WorkoutSessionLoaded;
                    final step = currentState.currentStep;

                    return Row(
                      spacing: AppSpacing.md,
                      children: [
                        if (step is WorkoutStepTransition)
                          Expanded(
                            child: FilledButton(
                              onPressed: currentState.isRestingPaused ? cubit.resumeRestTimer : cubit.pauseRestTimer,
                              child: Text(currentState.isRestingPaused ? 'Resume' : 'Pause'),
                            ),
                          ),
                        Expanded(
                          child: OutlinedButton(onPressed: cubit.canGoToNextStep ? cubit.setNextStep : null, child: Text(_getNextButtonText(step))),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        }

        return Scaffold(appBar: AppBar(title: const Text('Loading Session...')));
      },
    );
  }

  void _showSessionFinishedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Session Complete'),
          content: const Text('Congratulations! You have completed your workout session.'),
          actions: [
            TextButton(
              onPressed: () {
                dialogContext.pop();
                cubit.resetFinishedSession();
              },
              child: const Text('OK'),
            ),
            FilledButton(
              onPressed: () async {
                dialogContext.pop();
                cubit.resetFinishedSession();
                await Future.delayed(const Duration(milliseconds: 300));
                _showProgressionRecommendations();
              },
              child: const Text('View Progress'),
            ),
          ],
        );
      },
    );
  }

  void _showProgressionRecommendations() {
    final recommendations = cubit.getProgressionRecommendations();
    final performanceSummaries = cubit.getAllExercisePerformanceSummaries();

    if (recommendations.isNotEmpty) {
      final recommendationsJson = jsonEncode(recommendations.map((key, value) => MapEntry(key.toString(), value.toJson())));
      final performanceSummariesJson = jsonEncode(performanceSummaries.map((key, value) => MapEntry(key.toString(), value.toJson())));

      context.pushNamed(
        ProgressionRecommendationsScreen.routeName,
        queryParameters: {'recommendations': recommendationsJson, 'performance_summaries': performanceSummariesJson},
      );
    } else {
      // Show a simple message if no recommendations available
      showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('No Progression Data'),
            content: const Text('Complete more sets to get personalized progression recommendations.'),
            actions: [TextButton(onPressed: () => dialogContext.pop(), child: const Text('OK'))],
          );
        },
      );
    }
  }

  // Helper methods to reduce code duplication
  String _getExerciseDisplayName(WorkoutStep step, WorkoutStepExercise nextExerciseStep) {
    return switch (step) {
      WorkoutStepTransition() => '${nextExerciseStep.exercise.exerciseName} - Set ${nextExerciseStep.setNumber}',
      WorkoutStepExercise() => step.exercise.exerciseName,
    };
  }

  String _getExerciseRepsDisplay(WorkoutStep step, WorkoutStepExercise nextExerciseStep) {
    return switch (step) {
      WorkoutStepExercise() => '${step.exercise.sets} X ${step.exercise.reps}',
      WorkoutStepTransition() => '${nextExerciseStep.exercise.sets} X ${nextExerciseStep.exercise.reps}',
    };
  }

  String _getExerciseTypeDisplay(WorkoutStep step, WorkoutStepExercise nextExerciseStep) {
    return switch (step) {
      WorkoutStepExercise() => step.exercise.exerciseType.name,
      WorkoutStepTransition() => nextExerciseStep.exercise.exerciseType.name,
    };
  }

  bool _hasSuggestedWeight(WorkoutStep step, WorkoutStepExercise nextExerciseStep) {
    return switch (step) {
      WorkoutStepExercise() => step.exercise.weight != null,
      WorkoutStepTransition() => nextExerciseStep.exercise.weight != null,
    };
  }

  double? _getSuggestedWeight(WorkoutStep step, WorkoutStepExercise nextExerciseStep) {
    return switch (step) {
      WorkoutStepExercise() => step.exercise.weight,
      WorkoutStepTransition() => nextExerciseStep.exercise.weight,
    };
  }

  String _getNextButtonText(WorkoutStep step) {
    return switch (step) {
      WorkoutStepExercise() => 'Next',
      WorkoutStepTransition() => 'Skip Rest',
    };
  }
}
