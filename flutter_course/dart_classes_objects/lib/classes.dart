import 'dart:math';

main() {
  var p = Point(2, 2);
  print(p.y == 2);
  print(p.distanceTo(Point(4, 4)));
}

// Classes
// https://dart.dev/language/classes
class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
  // methods
  // https://dart.dev/language/methods
  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}
