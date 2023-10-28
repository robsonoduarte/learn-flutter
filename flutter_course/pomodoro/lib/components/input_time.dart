import 'package:flutter/material.dart';

class InputTime extends StatelessWidget {
  final String title;
  final int value;

  const InputTime({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                primary: Colors.red,
              ),
              onPressed: () {},
              child: const Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
            Text(
              '$value min',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                primary: Colors.red,
              ),
              onPressed: () {},
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
