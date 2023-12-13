main() {
  // https://dart.dev/language/constructors
  print(Point(9.0, 8.0));
  print(Point.create(10.0, 11.0));
}

class Point {
  double x = 0;
  double y = 0;

  // Generative constructor with initializing formal parameters:
  Point(this.x, this.y);

  // Named constructors
  Point.create(this.x, this.y);

  @override
  String toString() {
    return "Point($x, $y)";
  }
}
