import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? won;
  final void Function() onRestart;

  const ResultWidget({
    super.key,
    required this.won,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35,
              ),
              onPressed: onRestart,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);

  _getColor() {
    if (won == null) return Colors.yellow;
    if (won!) return Colors.green[300];
    return Colors.red[300];
  }

  _getIcon() {
    if (won == null) return Icons.sentiment_satisfied;
    if (won!) return Icons.sentiment_very_satisfied;
    return Icons.sentiment_very_dissatisfied;
  }
}
