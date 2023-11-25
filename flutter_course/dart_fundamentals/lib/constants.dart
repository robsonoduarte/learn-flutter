import 'dart:io';

main() {
  // the official Dart constant documentation:
  // https://dart.dev/language/variables#final-and-const

  // inferring the constant variable using the keyword const (compilation time)
  const PI = 3.1415;
  stdout.write("inform the radius :");
  // inferring the constant variable using the keyword final (runtime time)
  final radius = double.parse(stdin.readLineSync()!);
  final area = PI * radius * radius;
  print("The area of circle is : $area");
}
