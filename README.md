# Lifter - Weight Lifting Progression App

A Flutter application that helps track weight lifting progress and provides intelligent progression recommendations based on performance data.

## Features

- **Local SQL Database**: Uses Drift (SQLite) for structured data storage
- **Intelligent Progression Algorithm**: Analyzes performance and suggests weight/rep adjustments
- **Workout Tracking**: Log workouts, exercises, and sets with weight, reps, and RPE
- **Progress Analysis**: Track progress over time with trend analysis
- **Clean Architecture**: Follows Flutter best practices with proper separation of concerns

## Architecture

The app follows clean architecture principles with the following structure:

```
lib/
├── app/                    # App-level configuration
│   ├── configuration/      # Build configuration
│   ├── dependencies/       # Dependency injection
│   ├── theming/           # Design system
│   └── ui/                # Navigation
├── features/              # Feature modules
│   ├── workouts/          # Workout management
│   │   ├── data/          # Database, repositories
│   │   └── ui/            # Screens, cubits
│   ├── exercises/         # Exercise management
│   └── progress/          # Progress tracking
└── main.dart              # App entry point
```

## Progression Algorithm

The app uses an intelligent algorithm to determine progression recommendations:

- **Weight Increase**: When consistently hitting target reps (6-12) with stable weight
- **Rep Increase**: When weight is appropriate but reps are in the 8-15 range
- **Weight Decrease**: When struggling with current weight (high RPE, low reps)
- **Maintain**: When current parameters are appropriate

The algorithm considers:
- Recent performance (last 3 workouts)
- Rate of Perceived Exertion (RPE)
- Consistency in hitting target reps
- Weight stability over time

## Getting Started

### Prerequisites

- Flutter SDK (3.7.2 or higher)
- Dart SDK
- Android Studio / VS Code

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Generate code:
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. Run the app:
   ```bash
   flutter run
   ```

### Development

The app uses several code generation tools:

- **Drift**: For database code generation
- **Freezed**: For immutable data classes
- **Build Runner**: For code generation orchestration

To regenerate code after changes:
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Database Schema

The app uses three main tables:

### Exercises
- `id`: Primary key
- `name`: Exercise name
- `category`: Exercise category (strength, cardio, flexibility)
- `muscleGroup`: Target muscle group
- `description`: Optional description
- `createdAt`: Creation timestamp

### Workouts
- `id`: Primary key
- `name`: Workout name
- `date`: Workout date
- `notes`: Optional notes
- `createdAt`: Creation timestamp

### Sets
- `id`: Primary key
- `workoutId`: Foreign key to workouts
- `exerciseId`: Foreign key to exercises
- `weight`: Weight in kg
- `reps`: Number of repetitions
- `rpe`: Rate of Perceived Exertion (1-10)
- `isWarmup`: Whether this is a warmup set
- `createdAt`: Creation timestamp

## Testing

The app includes comprehensive testing:

- **Unit Tests**: For models, repositories, and business logic
- **Widget Tests**: For UI components
- **Bloc Tests**: For state management logic

Run tests:
```bash
flutter test
```

## Dependencies

### Core Dependencies
- `flutter_bloc`: State management
- `drift`: SQL database
- `go_router`: Navigation
- `get_it`: Dependency injection
- `freezed`: Immutable data classes

### Development Dependencies
- `build_runner`: Code generation
- `mockito`: Testing mocks
- `bloc_test`: Bloc testing utilities

## Contributing

1. Follow the established architecture patterns
2. Use absolute imports (`package:lifter/...`)
3. Add tests for new features
4. Follow the coding standards in `analysis_options.yaml`

## License

This project is licensed under the MIT License.
