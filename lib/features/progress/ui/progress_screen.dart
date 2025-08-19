import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  static const String routeName = 'progress';

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress'), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: const Center(child: Text('Progress Screen - Coming Soon')),
    );
  }
}
