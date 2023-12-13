main() {
  // https://dart.dev/language/constructors
  print(Point(9.0, 8.0));
  print(Point.create(10.0, 11.0));

  final point = Point(12.0, 13.0);
  print(point.x);
  print(point.y);
}

class Point {
  // private fields
  double _x = 0;
  double _y = 0;

  // Generative constructor with initializing formal parameters:
  Point(this._x, this._y);

  // Named constructors
  Point.create(this._x, this._y);

  // get methods
  double get x => _x;
  double get y => _y;

  @override
  String toString() {
    return "Point($_x, $_y)";
  }
}
