import 'package:flutter/material.dart';
import 'package:minefield/components/field_widget.dart';
import 'package:minefield/components/result_widget.dart';
import 'package:minefield/models/explosion_exception.dart';
import 'package:minefield/models/field.dart';

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    Field n1 = Field(1, 0);
    n1.undermined();
    Field n2 = Field(1, 0);
    n2.undermined();
    Field field = Field(0, 0);
    field.addNeighborhood(n1);
    field.addNeighborhood(n2);
    try {
      //field.undermined();
      //field.open();
      field.toggleMarking();
    } on ExplosionException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: true,
          onRestart: _restart,
        ),
        body: Container(
          child: FieldWidget(
            field: field,
            onOpen: _open,
            onToggleMarking: _toggleMarking,
          ),
        ),
      ),
    );
  }

  _restart() {
    print('restaring');
  }

  _open(Field field) {
    print("open");
  }

  _toggleMarking(Field field) {
    print("toggle");
  }
}
