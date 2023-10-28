import 'package:flutter/material.dart';
import 'package:pomodoro/components/stopwatch_button.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Time to work',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '25:00',
            style: TextStyle(
              fontSize: 120,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: StopWatchButton(
                  text: 'Start',
                  icon: Icons.play_arrow,
                ),
              ),
/*              Padding(
                padding: EdgeInsets.all(8.0),
                child: StopWatchButton(
                  text: 'Stop',
                  icon: Icons.stop,
                ),
              ),*/
              Padding(
                padding: EdgeInsets.all(8.0),
                child: StopWatchButton(
                  text: 'Restart',
                  icon: Icons.refresh,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
