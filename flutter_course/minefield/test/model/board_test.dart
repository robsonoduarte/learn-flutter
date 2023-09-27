import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/board.dart';

main() {
  test('Win Game', () {
    Board board = Board(
      2,
      2,
      0,
    );
    board.fields[0].undermined();
    board.fields[3].undermined();
    // playing...
    board.fields[0].toggleMarking();
    board.fields[1].open();
    board.fields[2].open();
    board.fields[3].toggleMarking();
    expect(board.resolved, isTrue);
  });
}
