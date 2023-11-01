import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/stopwatch_button.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Time to work',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${context.watch<PomodoroStore>().minutes.toString().padLeft(2, '0')}:${context.watch<PomodoroStore>().seconds.toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 120,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Observer(
            builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!context.watch<PomodoroStore>().started)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StopWatchButton(
                      text: 'Start',
                      icon: Icons.play_arrow,
                      click: context.read<PomodoroStore>().start,
                    ),
                  ),
                if (context.watch<PomodoroStore>().started)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StopWatchButton(
                      text: 'Stop',
                      icon: Icons.stop,
                      click: context.read<PomodoroStore>().stop,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StopWatchButton(
                    text: 'Restart',
                    icon: Icons.refresh,
                    click: context.read<PomodoroStore>().restart,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
