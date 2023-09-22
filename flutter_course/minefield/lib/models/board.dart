import 'dart:math';

import 'package:minefield/models/field.dart';

class Board {
  final int lines;
  final int columns;
  final int amountBombs;
  final List<Field> _fields = [];

  Board(
    this.lines,
    this.columns,
    this.amountBombs,
  ) {
    _createFields();
    _relateNeighbors();
    _drawMines();
  }

  List<Field> get fields => _fields;
  bool get resolved => _fields.every((f) => f.resolved);

  void restart() {
    for (var c in _fields) {
      c.restart();
    }
    _drawMines();
  }

  void revelBombs() {
    for (var c in _fields) {
      c.revealBombs();
    }
  }

  void _createFields() {
    for (int l = 0; l < lines; l++) {
      for (int c = 0; c < columns; c++) {
        _fields.add(Field(l, c));
      }
    }
  }

  void _relateNeighbors() {
    for (var campo in _fields) {
      for (var neighbor in _fields) {
        campo.addNeighborhood(neighbor);
      }
    }
  }

  void _drawMines() {
    int drawn = 0;
    if (amountBombs > lines * columns) {
      return;
    }
    while (drawn < amountBombs) {
      int i = Random().nextInt(_fields.length);
      if (!_fields[i].isUndermined) {
        drawn++;
        _fields[i].undermined();
      }
    }
  }
}
