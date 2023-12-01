import 'dart:math';

main() {
  // Branches
  // https://dart.dev/language/branches

  // IF
  // https://dart.dev/language/branches#if
  final grade = Random().nextInt(11);
  if (grade > 7) {
    print('approved your grade is $grade');
  } else if (grade >= 5) {
    print('recuperation because your grade is $grade');
  } else {
    print("you are reproved your grade is $grade");
  }

  // IF CASE
  // https://dart.dev/language/branches#if-case
  final pair = [1, 2];
  if (pair case [int x, int y]) {
    print('Was coordinate array $x,$y');
  }
}
