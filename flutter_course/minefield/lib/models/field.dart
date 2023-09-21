import 'package:minefield/models/explosion_exception.dart';

class Field {
  final int line;
  final int column;
  final List<Field> neighborhood = [];

  bool _open = false;
  bool _marked = false;
  bool _undermined = false;
  bool _exploded = false;

  Field(this.line, this.column);

  bool get isUndermined => _undermined;
  bool get isExploded => _exploded;
  bool get isOpen => _open;
  bool get isMarked => _marked;
  bool get saveNeighborhood => neighborhood.every((n) => !n._undermined);
  bool get resolved {
    bool underminedAndMarked = isUndermined && isMarked;
    bool saveAndOpen = !isUndermined && isOpen;
    return underminedAndMarked || saveAndOpen;
  }

  int get amountMinesNeighborhood {
    return neighborhood.where((v) => v.isUndermined).length;
  }

  void addNeighborhood(Field neighborhood) {
    final deltaLine = (line - neighborhood.line).abs();
    final deltaColumn = (column - neighborhood.column).abs();

    if (deltaLine == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaLine <= 1 && deltaColumn <= 1) {
      this.neighborhood.add(neighborhood);
    }
  }

  void open() {
    if (_open) {
      return;
    }
    _open = true;
    if (_undermined) {
      _exploded = true;
      throw ExplosionException();
    }
    if (saveNeighborhood) {
      neighborhood.forEach((n) => n.open());
    }
  }

  void revealBombs() {
    if (_undermined) {
      _open = true;
    }
  }

  void undermined() {
    _undermined = true;
  }

  void toggleMarking() {
    _marked = !_marked;
  }

  void restart() {
    _open = false;
    _marked = false;
    _undermined = false;
    _exploded = false;
  }
}
