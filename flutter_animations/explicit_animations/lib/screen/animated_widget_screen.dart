import 'package:flutter/material.dart';

class AnimatedWidgetScreen extends StatefulWidget {
  const AnimatedWidgetScreen({super.key});
  @override
  State<AnimatedWidgetScreen> createState() => _AnimatedWidgetScreenState();
}

class _AnimatedWidgetScreenState extends State<AnimatedWidgetScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Widget"),
      ),
      body: AnimatedLogo(animation: animation),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    controller.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}
