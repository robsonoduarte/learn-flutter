import 'package:flutter/material.dart';
import 'package:minefield/components/board_widget.dart';
import 'package:minefield/components/result_widget.dart';
import 'package:minefield/models/board.dart';
import 'package:minefield/models/explosion_exception.dart';
import 'package:minefield/models/field.dart';

class MineFieldApp extends StatefulWidget {
  const MineFieldApp({super.key});

  @override
  State<MineFieldApp> createState() => _MineFieldAppState();
}

class _MineFieldAppState extends State<MineFieldApp> {
  bool? _won;
  Board? _board;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: _won,
          onRestart: _restart,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return BoardWidget(
                board: _getBoard(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
                onOpen: _open,
                onToggleMarking: _toggleMarking,
              );
            },
          ),
        ),
      ),
    );
  }

  Board _getBoard(double width, double height) {
    if (_board == null) {
      int columns = 15;
      double fieldSize = width / columns;
      int lines = (height / fieldSize).floor();
      _board = Board(
        lines,
        columns,
        50,
      );
    }
    return _board!;
  }

  _restart() {
    setState(() {
      _won = null;
      _board!.restart();
    });
  }

  _open(Field field) {
    setState(() {
      if (_won != null) {
        return;
      }
      try {
        field.open();
        if (_board!.resolved) {
          _won = true;
        }
      } on ExplosionException {
        _won = false;
        _board!.revelBombs();
      }
    });
  }

  _toggleMarking(Field field) {
    if (_won != null) {
      return;
    }
    setState(() {
      field.toggleMarking();
    });
  }
}
