import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lifter/app/theming/spacing.dart';
import 'package:lifter/features/progress/progress.dart';

class ProgressionRecommendationsScreen extends StatelessWidget {
  final Map<int, ProgressionRecommendation> recommendations;
  final Map<int, ExercisePerformanceSummary> performanceSummaries;

  const ProgressionRecommendationsScreen({super.key, required this.recommendations, required this.performanceSummaries});

  static const routeName = 'progression-recommendations';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.trending_up, color: Theme.of(context).colorScheme.primary),
            const Gap(AppSpacing.sm),
            const Text('Progression Recommendations'),
          ],
        ),
        leading: const BackButton(),
      ),
      body:
          recommendations.isEmpty
              ? const EmptyStateWidget()
              : RecommendationsListWidget(recommendations: recommendations, performanceSummaries: performanceSummaries),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fitness_center_outlined, size: 80, color: theme.colorScheme.outline),
            const Gap(AppSpacing.lg),
            Text('No Progression Data Available', style: theme.textTheme.headlineSmall, textAlign: TextAlign.center),
            const Gap(AppSpacing.md),
            Text(
              'Complete more workout sets to get personalized progression recommendations.',
              style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.outline),
              textAlign: TextAlign.center,
            ),
            const Gap(AppSpacing.xl),
            FilledButton(onPressed: () => context.pop(), child: const Text('Go Back')),
          ],
        ),
      ),
    );
  }
}

class RecommendationsListWidget extends StatelessWidget {
  final Map<int, ProgressionRecommendation> recommendations;
  final Map<int, ExercisePerformanceSummary> performanceSummaries;

  const RecommendationsListWidget({super.key, required this.recommendations, required this.performanceSummaries});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSection(exerciseCount: recommendations.length),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: recommendations.length,
            itemBuilder: (context, index) {
              final entry = recommendations.entries.elementAt(index);
              final exerciseId = entry.key;
              final recommendation = entry.value;
              final performanceSummary = performanceSummaries[exerciseId];

              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: ExerciseRecommendationCard(recommendation: recommendation, performanceSummary: performanceSummary),
              );
            },
          ),
        ),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  final int exerciseCount;

  const HeaderSection({super.key, required this.exerciseCount});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Workout Performance Analysis',
            style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onPrimaryContainer, fontWeight: FontWeight.bold),
          ),
          const Gap(AppSpacing.sm),
          Text(
            'Based on your recent workout performance, here are personalized recommendations to optimize your training:',
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimaryContainer),
          ),
          const Gap(AppSpacing.md),
          Row(
            children: [
              Icon(Icons.insights, color: theme.colorScheme.onPrimaryContainer, size: 20),
              const Gap(AppSpacing.xs),
              Text(
                '$exerciseCount exercise${exerciseCount == 1 ? '' : 's'} analyzed',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onPrimaryContainer, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExerciseRecommendationCard extends StatelessWidget {
  final ProgressionRecommendation recommendation;
  final ExercisePerformanceSummary? performanceSummary;

  const ExerciseRecommendationCard({super.key, required this.recommendation, this.performanceSummary});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _getRecommendationColor(theme, recommendation.type), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (performanceSummary != null) ...[
            Text(performanceSummary!.exerciseName, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const Gap(AppSpacing.sm),
            PerformanceSummaryWidget(performanceSummary: performanceSummary!),
            const Gap(AppSpacing.sm),
          ],
          RecommendationDetailsWidget(recommendation: recommendation),
        ],
      ),
    );
  }

  Color _getRecommendationColor(ThemeData theme, ProgressionType type) {
    return switch (type) {
      ProgressionType.maintain => theme.colorScheme.outline,
      ProgressionType.increaseWeight => Colors.green,
      ProgressionType.increaseReps => Colors.blue,
      ProgressionType.decreaseWeight => Colors.orange,
      ProgressionType.decreaseReps => Colors.red,
    };
  }
}

class PerformanceSummaryWidget extends StatelessWidget {
  final ExercisePerformanceSummary performanceSummary;

  const PerformanceSummaryWidget({super.key, required this.performanceSummary});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Performance Summary:', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, color: theme.colorScheme.outline)),
        const Gap(AppSpacing.xs),
        Row(
          children: [
            PerformanceChip(
              label: 'Under',
              count: performanceSummary.underperformedCount,
              total: performanceSummary.completedSets,
              color: Colors.red,
            ),
            const Gap(AppSpacing.xs),
            PerformanceChip(label: 'Target', count: performanceSummary.performedCount, total: performanceSummary.completedSets, color: Colors.green),
            const Gap(AppSpacing.xs),
            PerformanceChip(
              label: 'Over',
              count: performanceSummary.overperformedCount,
              total: performanceSummary.completedSets,
              color: Colors.orange,
            ),
          ],
        ),
        const Gap(AppSpacing.xs),
        Text(
          'Completed: ${performanceSummary.completedSets}/${performanceSummary.totalSets} sets',
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.outline),
        ),
      ],
    );
  }
}

class PerformanceChip extends StatelessWidget {
  final String label;
  final int count;
  final int total;
  final Color color;

  const PerformanceChip({super.key, required this.label, required this.count, required this.total, required this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percentage = total > 0 ? (count / total * 100).round() : 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text('$label: $count ($percentage%)', style: theme.textTheme.bodySmall?.copyWith(color: color, fontWeight: FontWeight.w500)),
    );
  }
}

class RecommendationDetailsWidget extends StatelessWidget {
  final ProgressionRecommendation recommendation;

  const RecommendationDetailsWidget({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(_getRecommendationIcon(recommendation.type), color: _getRecommendationColor(theme, recommendation.type), size: 20),
            const Gap(AppSpacing.xs),
            Text(
              _getRecommendationTitle(recommendation.type),
              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: _getRecommendationColor(theme, recommendation.type)),
            ),
          ],
        ),
        const Gap(AppSpacing.sm),
        Text(recommendation.reasoning, style: theme.textTheme.bodyMedium),
        if (recommendation.suggestedWeight != null || recommendation.suggestedReps != null) ...[
          const Gap(AppSpacing.sm),
          SuggestedParametersCard(recommendation: recommendation),
        ],
      ],
    );
  }

  String _getRecommendationTitle(ProgressionType type) {
    return switch (type) {
      ProgressionType.maintain => 'Maintain Current Parameters',
      ProgressionType.increaseWeight => 'Increase Weight',
      ProgressionType.increaseReps => 'Increase Reps',
      ProgressionType.decreaseWeight => 'Decrease Weight',
      ProgressionType.decreaseReps => 'Decrease Reps',
    };
  }

  IconData _getRecommendationIcon(ProgressionType type) {
    return switch (type) {
      ProgressionType.maintain => Icons.pause_circle_outline,
      ProgressionType.increaseWeight => Icons.trending_up,
      ProgressionType.increaseReps => Icons.add_circle_outline,
      ProgressionType.decreaseWeight => Icons.trending_down,
      ProgressionType.decreaseReps => Icons.remove_circle_outline,
    };
  }

  Color _getRecommendationColor(ThemeData theme, ProgressionType type) {
    return switch (type) {
      ProgressionType.maintain => theme.colorScheme.outline,
      ProgressionType.increaseWeight => Colors.green,
      ProgressionType.increaseReps => Colors.blue,
      ProgressionType.decreaseWeight => Colors.orange,
      ProgressionType.decreaseReps => Colors.red,
    };
  }
}

class SuggestedParametersCard extends StatelessWidget {
  final ProgressionRecommendation recommendation;

  const SuggestedParametersCard({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(color: theme.colorScheme.primaryContainer, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Icon(Icons.lightbulb_outline, size: 16, color: theme.colorScheme.onPrimaryContainer),
          const Gap(AppSpacing.xs),
          Text(
            'Suggested: ${_formatRecommendation(recommendation)}',
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onPrimaryContainer, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  String _formatRecommendation(ProgressionRecommendation recommendation) {
    final parts = <String>[];

    if (recommendation.suggestedWeight != null) {
      parts.add('${recommendation.suggestedWeight!.toStringAsFixed(1)}kg');
    }

    if (recommendation.suggestedReps != null) {
      parts.add('${recommendation.suggestedReps} reps');
    }

    return parts.join(' × ');
  }
}
