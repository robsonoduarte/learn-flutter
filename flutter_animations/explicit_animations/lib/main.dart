import 'package:explicit_animations/screen/animated_builder_screen.dart';
import 'package:explicit_animations/screen/animated_widget_screen.dart';
import 'package:explicit_animations/screen/animation_controller_screen.dart';
import 'package:explicit_animations/screen/simultaneous_animations_screen.dart';
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
            button(
              "Animation Controller",
              const AnimationControllerScreen(),
            ),
            button(
              "Animated Widget",
              const AnimatedWidgetScreen(),
            ),
            button(
              "Status Listener",
              const StatusListenerScreen(),
            ),
            button(
              "Animated Builder",
              const AnimatedBuilderScreen(),
            ),
            button(
              "Simultaneous Animations",
              const SimultaneousAnimationsScreen(),
            ),
          ],
        ),
      ),
    );
  }

  button(String text, Widget widget) {
    return ElevatedButton(
      child: Text(text),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => widget),
      ),
    );
  }
}
