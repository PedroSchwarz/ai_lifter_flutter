# Workout Plan Generation System

## Overview

The workout plan generation system provides intelligent, science-based workout plans based on proven training methodologies. It supports multiple training goals including strength, hypertrophy, endurance, powerlifting, and bodybuilding.

## Architecture

The system follows clean architecture principles with clear separation of concerns:

```
lib/features/progress/
├── domain/
│   ├── entities/
│   │   ├── workout_plan.dart          # Core workout plan entities
│   │   ├── progression_recommendation.dart
│   │   └── progress_trend.dart
│   ├── use_cases/
│   │   ├── generate_workout_plan_use_case.dart      # Main orchestrator
│   │   ├── generate_strength_plan_use_case.dart     # 5x5 strength training
│   │   ├── generate_hypertrophy_plan_use_case.dart  # Muscle building
│   │   ├── analyze_progression_use_case.dart        # Progression analysis
│   │   ├── calculate_one_rep_max_use_case.dart      # 1RM calculations
│   │   ├── calculate_training_weight_use_case.dart  # Training weight calculations
│   │   └── analyze_progress_trends_use_case.dart    # Progress tracking
│   └── examples/
│       └── workout_plan_examples.dart               # Usage examples
```

## Training Methodologies

### 1. Strength Training (5x5)
- **Focus**: Maximum strength gains
- **Rep Range**: 5 reps per set
- **Sets**: 5 sets for primary movements
- **Rest**: 3-5 minutes between sets
- **Progression**: Linear progression with weight increases
- **Best For**: Beginners to intermediate lifters, strength athletes

**Example Structure**:
- Primary compound movement: 5x5 (e.g., Barbell Bench Press)
- Secondary compound movement: 3x5 (e.g., Incline Dumbbell Press)
- Accessory movement: 3x8-10 (e.g., Dumbbell Flyes)

### 2. Hypertrophy Training
- **Focus**: Muscle growth and size
- **Rep Range**: 8-15 reps per set
- **Sets**: 3-4 sets per exercise
- **Rest**: 60-90 seconds between sets
- **Progression**: Volume and weight progression
- **Best For**: Bodybuilders, muscle building goals

**Example Structure**:
- Primary compound movement: 4x8-10 (e.g., Dumbbell Bench Press)
- Secondary compound movement: 3x10-12 (e.g., Incline Dumbbell Press)
- First isolation movement: 3x12-15 (e.g., Cable Flyes)
- Second isolation movement: 3x12-15 (e.g., Dumbbell Pullovers)
- Optional drop set: 2x15 (if workout duration > 60 minutes)

### 3. Endurance Training
- **Focus**: Muscular endurance and stamina
- **Rep Range**: 20-30 reps per set
- **Sets**: 3 sets per exercise
- **Rest**: 30-60 seconds between sets
- **Progression**: Rep progression and time under tension
- **Best For**: Athletes, functional fitness, endurance sports

**Example Structure**:
- High rep compound movements: 3x20 (e.g., Push-ups)
- High rep isolation movements: 3x25 (e.g., Wall Push-ups)
- Cardio component: 2x30 seconds (e.g., High Knees)

### 4. Powerlifting Training
- **Focus**: Maximal strength and competition performance
- **Rep Range**: 1-5 reps per set
- **Sets**: 5 sets for main lifts, 3 for secondary
- **Rest**: 3-5 minutes between main lifts
- **Progression**: Heavy weight progression
- **Best For**: Powerlifters, strength athletes, competition prep

**Example Structure**:
- Main lift: 5x3 (e.g., Barbell Bench Press)
- Secondary lift: 3x5 (e.g., Incline Barbell Press)
- Accessory work: 3x8 (e.g., Dumbbell Flyes)

### 5. Bodybuilding Training
- **Focus**: Aesthetic development and muscle symmetry
- **Rep Range**: 8-15 reps per set
- **Sets**: 3-4 sets per exercise
- **Rest**: 60-90 seconds between sets
- **Progression**: Volume and isolation focus
- **Best For**: Bodybuilders, aesthetic goals

*Note: Bodybuilding plans use the same structure as hypertrophy plans*

## Muscle Groups Supported

The system supports all major muscle groups:

- **Chest**: Bench press variations, flyes, push-ups
- **Back**: Deadlifts, rows, pull-ups, lat pulldowns
- **Legs**: Squats, leg press, Romanian deadlifts, extensions
- **Shoulders**: Overhead press, lateral raises, rear delt work
- **Arms**: Bicep curls, tricep extensions, compound movements
- **Core**: Planks, crunches, Russian twists, Turkish get-ups
- **Full Body**: Compound movements, functional exercises

## Usage Examples

### Basic Usage

```dart
import 'package:lifter/features/progress/progress.dart';

// Create a workout plan request
final request = WorkoutPlanRequest(
  planType: WorkoutPlanType.strength,
  targetMuscleGroup: MuscleGroup.chest,
  workoutDuration: 60,
  availableExerciseIds: [1, 8, 15],
  userWeight: 80.0,
  userExperienceLevel: 3,
);

// Generate the workout plan
final workoutPlan = await repository.generateWorkoutPlan(request: request);

// Access the generated plan
print('Plan: ${workoutPlan.name}');
print('Type: ${workoutPlan.type}');
print('Duration: ${workoutPlan.totalDuration} minutes');
print('Exercises: ${workoutPlan.exercises.length}');

// Access individual exercises
for (final exercise in workoutPlan.exercises) {
  print('${exercise.exerciseName}: ${exercise.sets}x${exercise.reps}');
  print('Rest: ${exercise.restSeconds} seconds');
  print('Notes: ${exercise.notes}');
}
```

### Advanced Usage with Custom Use Cases

```dart
import 'package:lifter/features/progress/progress.dart';

// Create individual use cases
final strengthUseCase = GenerateStrengthPlanUseCase();
final hypertrophyUseCase = GenerateHypertrophyPlanUseCase();

// Create the main orchestrator
final workoutPlanGenerator = GenerateWorkoutPlanUseCase(
  generateStrengthPlanUseCase: strengthUseCase,
  generateHypertrophyPlanUseCase: hypertrophyUseCase,
);

// Generate different plan types
final strengthPlan = workoutPlanGenerator(request: strengthRequest);
final hypertrophyPlan = workoutPlanGenerator(request: hypertrophyRequest);
```

### Using the Examples

```dart
import 'package:lifter/features/progress/domain/examples/workout_plan_examples.dart';

// Generate pre-configured workout plans
final chestStrengthPlan = WorkoutPlanExamples.generateChestStrengthPlan();
final backHypertrophyPlan = WorkoutPlanExamples.generateBackHypertrophyPlan();
final legsEndurancePlan = WorkoutPlanExamples.generateLegsEndurancePlan();
final fullBodyPowerliftingPlan = WorkoutPlanExamples.generateFullBodyPowerliftingPlan();
```

## Exercise Selection Logic

The system intelligently selects exercises based on:

1. **Training Goal**: Different exercises for strength vs. hypertrophy
2. **Muscle Group**: Compound movements for primary, isolation for accessories
3. **Workout Duration**: Longer workouts include more exercises and advanced techniques
4. **User Experience**: Beginners get simpler movements, advanced users get complex variations
5. **Exercise Type**: Compound movements prioritized for strength, isolation for hypertrophy

## Rest Periods

Rest periods are scientifically designed for each training type:

- **Strength**: 3-5 minutes (allows full ATP recovery)
- **Hypertrophy**: 60-90 seconds (maintains metabolic stress)
- **Endurance**: 30-60 seconds (minimal rest for stamina)
- **Powerlifting**: 3-5 minutes (maximal recovery for heavy lifts)

## Progression Strategies

### Strength Training
- Linear progression: Increase weight when 5x5 is completed
- Deload weeks: Reduce weight by 10% every 4-6 weeks
- Form focus: Maintain perfect form before increasing weight

### Hypertrophy Training
- Volume progression: Increase sets before increasing weight
- Weight progression: Increase weight when 12-15 reps are achieved
- Technique variation: Change exercise variations every 4-6 weeks

### Endurance Training
- Rep progression: Increase reps before increasing weight
- Time progression: Increase time under tension
- Circuit training: Combine multiple exercises with minimal rest

## Integration with Progression Algorithm

The workout plan system integrates with the progression algorithm to:

1. **Analyze Performance**: Track progress across different training phases
2. **Adjust Plans**: Modify workout plans based on performance trends
3. **Calculate Weights**: Use 1RM calculations to determine training weights
4. **Recommend Changes**: Suggest when to switch between training types

## Customization Options

### Exercise Substitutions
```dart
// Customize available exercises
final request = WorkoutPlanRequest(
  // ... other parameters
  availableExerciseIds: [customExercise1, customExercise2, customExercise3],
);
```

### Training Parameters
```dart
// Adjust workout duration and intensity
final request = WorkoutPlanRequest(
  // ... other parameters
  workoutDuration: 90, // Extended workout
  userExperienceLevel: 5, // Advanced user
);
```

### Plan Modifications
```dart
// Modify generated plan
final plan = await repository.generateWorkoutPlan(request: request);

// Add custom exercises
plan.exercises.add(CustomExerciseRecommendation(...));

// Modify rest periods
for (final exercise in plan.exercises) {
  exercise.restSeconds = customRestPeriod;
}
```

## Best Practices

### For Beginners (Level 1-2)
- Start with strength training (5x5)
- Focus on compound movements
- Learn proper form before increasing weight
- Rest adequately between workouts

### For Intermediate (Level 3-4)
- Mix strength and hypertrophy training
- Include both compound and isolation movements
- Experiment with different rep ranges
- Track progress systematically

### For Advanced (Level 5)
- Use periodization principles
- Combine multiple training types
- Include advanced techniques (drop sets, supersets)
- Customize plans based on specific goals

## Testing

The system includes comprehensive testing:

```dart
// Test individual use cases
test('GenerateStrengthPlanUseCase generates correct plan structure', () {
  final useCase = GenerateStrengthPlanUseCase();
  final plan = useCase(request: testRequest);
  
  expect(plan.type, equals(WorkoutPlanType.strength));
  expect(plan.exercises.length, greaterThan(0));
  expect(plan.exercises.first.sets, equals(5));
  expect(plan.exercises.first.reps, equals(5));
});

// Test plan generation
test('GenerateWorkoutPlanUseCase routes to correct use case', () {
  final useCase = GenerateWorkoutPlanUseCase(
    generateStrengthPlanUseCase: MockGenerateStrengthPlanUseCase(),
    generateHypertrophyPlanUseCase: MockGenerateHypertrophyPlanUseCase(),
  );
  
  final plan = useCase(request: strengthRequest);
  verify(mockStrengthUseCase(request: strengthRequest)).called(1);
});
```

## Future Enhancements

1. **Periodization**: Add support for training cycles and phases
2. **Exercise Library**: Expand exercise database with more variations
3. **AI Integration**: Use machine learning to optimize plan generation
4. **Recovery Tracking**: Include rest day recommendations and recovery metrics
5. **Nutrition Integration**: Suggest nutrition timing based on workout type
6. **Social Features**: Share and rate workout plans with other users

## Contributing

When adding new training methodologies or exercises:

1. Follow the existing use case pattern
2. Add comprehensive tests
3. Update documentation
4. Ensure proper dependency injection
5. Maintain clean architecture principles

## Support

For questions or issues with the workout plan generation system:

1. Check the examples in `workout_plan_examples.dart`
2. Review the test files for usage patterns
3. Consult the progression algorithm documentation
4. Ensure all dependencies are properly registered in the locator
