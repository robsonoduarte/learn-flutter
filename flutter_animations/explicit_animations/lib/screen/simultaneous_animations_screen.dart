import 'package:flutter/material.dart';

class SimultaneousAnimationsScreen extends StatefulWidget {
  const SimultaneousAnimationsScreen({super.key});
  @override
  State<SimultaneousAnimationsScreen> createState() =>
      _SimultaneousAnimationsScreenState();
}

class _SimultaneousAnimationsScreenState
    extends State<SimultaneousAnimationsScreen>
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
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            controller.forward();
          }
        },
      );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simultaneous Animations"),
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

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}
