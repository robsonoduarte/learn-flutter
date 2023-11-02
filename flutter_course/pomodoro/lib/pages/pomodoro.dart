import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/input_time.dart';
import 'package:pomodoro/components/stopwatch.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: StopWatch(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
            ),
            child: Observer(
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputTime(
                    title: 'Work',
                    value: context.read<PomodoroStore>().workTime,
                    inc: context.read<PomodoroStore>().incWorkTime,
                    dec: context.read<PomodoroStore>().decWorkTime,
                  ),
                  InputTime(
                    title: 'Rest',
                    value: context.read<PomodoroStore>().restTime,
                    inc: context.read<PomodoroStore>().incRestTime,
                    dec: context.read<PomodoroStore>().decRestTime,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
