import 'package:flutter/material.dart';

class StopWatchButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? click;
  const StopWatchButton(
      {super.key, required this.text, required this.icon, this.click});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        children: [
          Icon(
            icon,
          ),
          Text(text)
        ],
      ),
      onPressed: click,
    );
  }
}
