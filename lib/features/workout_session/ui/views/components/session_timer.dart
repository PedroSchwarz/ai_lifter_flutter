import 'package:flutter/material.dart';

class SessionTimer extends StatefulWidget {
  final Duration duration;
  final bool isPaused;

  const SessionTimer({super.key, required this.duration, required this.isPaused});

  @override
  State<SessionTimer> createState() => _SessionTimerState();
}

class _SessionTimerState extends State<SessionTimer> with SingleTickerProviderStateMixin {
  late Animation<int> _timerAnimation;
  late AnimationController _timerController;

  @override
  void initState() {
    super.initState();

    _timerController = AnimationController(vsync: this, duration: widget.duration);

    _timerAnimation = IntTween(begin: widget.duration.inSeconds, end: 0).animate(CurvedAnimation(parent: _timerController, curve: Curves.linear));

    _timerController.forward();
  }

  @override
  void didUpdateWidget(covariant SessionTimer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isPaused != widget.isPaused) {
      if (widget.isPaused) {
        _timerController.stop();
      } else {
        _timerController.forward();
      }
    }
  }

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _timerAnimation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                value: _timerAnimation.value / widget.duration.inSeconds,
                strokeCap: StrokeCap.round,
                strokeWidth: 10,
                backgroundColor: Colors.grey.shade200,
              ),
            ),
            Text('${_timerAnimation.value}s', style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.primary)),
          ],
        );
      },
    );
  }
}
