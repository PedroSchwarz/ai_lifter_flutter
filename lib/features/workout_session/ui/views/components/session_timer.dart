import 'package:flutter/material.dart';

class SessionTimer extends StatefulWidget {
  final Duration duration;
  final bool isPaused;
  final VoidCallback? onTimerComplete;

  const SessionTimer({super.key, required this.duration, required this.isPaused, this.onTimerComplete});

  @override
  State<SessionTimer> createState() => _SessionTimerState();
}

class _SessionTimerState extends State<SessionTimer> with SingleTickerProviderStateMixin {
  late Animation<int> _timerAnimation;
  late AnimationController _timerController;

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  @override
  void didUpdateWidget(covariant SessionTimer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      _resetTimer();
    } else if (oldWidget.isPaused != widget.isPaused) {
      _handlePauseStateChange();
    }
  }

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }

  void _initializeTimer() {
    _timerController = AnimationController(vsync: this, duration: widget.duration);
    _timerAnimation = IntTween(begin: widget.duration.inSeconds, end: 0).animate(CurvedAnimation(parent: _timerController, curve: Curves.linear));

    _timerController.addStatusListener(_handleAnimationStatus);

    if (!widget.isPaused) {
      _timerController.forward();
    }
  }

  void _resetTimer() {
    _timerController.dispose();
    _initializeTimer();
  }

  void _handlePauseStateChange() {
    if (widget.isPaused) {
      _timerController.stop();
    } else {
      _timerController.forward();
    }
  }

  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onTimerComplete?.call();
    }
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
              height: 250,
              width: 250,
              child: CircularProgressIndicator(
                value: _timerAnimation.value / widget.duration.inSeconds,
                strokeCap: StrokeCap.round,
                strokeWidth: 16,
                backgroundColor: Colors.grey.shade200,
              ),
            ),
            Text('${_timerAnimation.value}s', style: theme.textTheme.headlineLarge?.copyWith(color: theme.colorScheme.primary)),
          ],
        );
      },
    );
  }
}
