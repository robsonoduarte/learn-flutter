import 'package:explicit_animations/animation_controller_screen.dart';
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
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnimationControllerScreen(),
                ),
              );
            },
            child: const Text("Animation Controller")),
      ),
    );
  }
}
