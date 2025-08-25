import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lifter/app/dependencies/locators.dart';
import 'package:lifter/app/theming/spacing.dart';
import 'package:lifter/features/progress/progress.dart';
import 'package:lifter/features/workout_session/ui/cubits/workout_session_cubit.dart';
import 'package:lifter/features/workout_session/workout_session.dart';

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
              if (state is WorkoutSessionLoaded) {
                if (state.hasSessionFinished) {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        title: const Text('Session Finished'),
                        content: const Text('You have completed the session.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              dialogContext.pop();
                              cubit.resetFinishedSession();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(state.workoutPlan.name),
                actions: [CircleAvatar(child: Text(state.workoutPlan.totalDurationInMinutes.toString()))],
              ),
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
                                switch (step) {
                                  WorkoutStepTransition() => Text(
                                    '${nextExerciseStep.exercise.exerciseName} - Set ${nextExerciseStep.setNumber}',
                                    style: theme.textTheme.titleLarge,
                                  ),
                                  WorkoutStepExercise() => Text(step.exercise.exerciseName, style: theme.textTheme.titleLarge),
                                },
                                Chip(
                                  backgroundColor: theme.colorScheme.inversePrimary,
                                  label: Text(switch (step) {
                                    WorkoutStepExercise() => '${step.exercise.sets} X ${step.exercise.reps}',
                                    WorkoutStepTransition() => '${nextExerciseStep.exercise.sets} X ${nextExerciseStep.exercise.reps}',
                                  }, style: theme.textTheme.bodyLarge),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                switch (step) {
                                  WorkoutStepExercise() => Text(step.exercise.exerciseType.name.toUpperCase()),
                                  WorkoutStepTransition() => Text(nextExerciseStep.exercise.exerciseType.name.toUpperCase()),
                                },
                                if (switch (step) {
                                  WorkoutStepExercise() => step.exercise.weight != null,
                                  WorkoutStepTransition() => nextExerciseStep.exercise.weight != null,
                                })
                                  Text(
                                    'Suggested Weight of: ${switch (step) {
                                      WorkoutStepExercise() => step.exercise.weight,
                                      WorkoutStepTransition() => nextExerciseStep.exercise.weight,
                                    }}kg',
                                  ),
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
                          child: OutlinedButton(
                            onPressed: cubit.canGoToNextStep ? cubit.setNextStep : null,
                            child: switch (step) {
                              WorkoutStepExercise() => const Text('Next'),
                              WorkoutStepTransition() => const Text('Skip Rest'),
                            },
                          ),
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
}
