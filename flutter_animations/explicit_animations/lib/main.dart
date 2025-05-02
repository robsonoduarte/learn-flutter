import 'package:explicit_animations/screen/animated_widget_screen.dart';
import 'package:explicit_animations/screen/animation_controller_screen.dart';
import 'package:explicit_animations/screen/status_listener_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ExplicitAnimation()));
}

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Animation Controller"),
              onPressed: () => push(const AnimationControllerScreen()),
            ),
            ElevatedButton(
              child: const Text("Animated Widget"),
              onPressed: () => push(const AnimatedWidgetScreen()),
            ),
            ElevatedButton(
              child: const Text("Status Listener"),
              onPressed: () => push(const StatusListenerScreen()),
            ),
          ],
        ),
      ),
    );
  }

  push(Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
