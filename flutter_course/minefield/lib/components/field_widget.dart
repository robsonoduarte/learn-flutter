import 'package:flutter/material.dart';
import 'package:minefield/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onToggleMarking;

  const FieldWidget({
    super.key,
    required this.field,
    required this.onOpen,
    required this.onToggleMarking,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onToggleMarking(field),
      child: _getImage(),
    );
  }

  Widget _getImage() {
    int amountMines = field.amountMinesNeighborhood;
    if (field.isOpen && field.isUndermined && field.isExploded) {
      return Image.asset('assets/images/bomb_0.jpeg');
    }
    if (field.isOpen && field.isUndermined) {
      return Image.asset('assets/images/bomb_1.jpeg');
    }
    if (field.isOpen) {
      return Image.asset('assets/images/open_$amountMines.jpeg');
    }
    if (field.isMarked) {
      return Image.asset('assets/images/flag.jpeg');
    }
    return Image.asset('assets/images/close.jpeg');
  }
}
