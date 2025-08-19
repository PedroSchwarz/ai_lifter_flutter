import 'package:flutter/material.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  static const String routeName = 'exercises';

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercises'), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: const Center(child: Text('Exercises Screen - Coming Soon')),
    );
  }
}
