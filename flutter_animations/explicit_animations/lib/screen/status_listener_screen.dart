import 'package:flutter/material.dart';

class StatusListenerScreen extends StatefulWidget {
  const StatusListenerScreen({super.key});
  @override
  State<StatusListenerScreen> createState() => _StatusListenerScreenState();
}

class _StatusListenerScreenState extends State<StatusListenerScreen>
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
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
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
        title: const Text("Status Listener"),
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
