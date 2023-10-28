import 'package:flutter/material.dart';
import 'package:pomodoro/components/input_time.dart';
import 'package:pomodoro/components/stopwatch.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: StopWatch(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputTime(title: 'Work', value: 25),
                InputTime(title: 'Rest', value: 5),
              ],
            ),
          )
        ],
      ),
    );
  }
}
