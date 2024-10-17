import 'dart:math';

import 'package:flutter/material.dart';

class ShapeShifting extends StatefulWidget {
  const ShapeShifting({super.key});

  @override
  State<ShapeShifting> createState() => _ShapeShiftingState();
}

class _ShapeShiftingState extends State<ShapeShifting> {
  late Color color;
  late double margin;
  late double borderRadius;

  @override
  void initState() {
    super.initState();
    color = randomColor();
    margin = randomMargin();
    borderRadius = randomBorderRadius();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Container(
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Change'),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}
