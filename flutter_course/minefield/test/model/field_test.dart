import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/field.dart';

main() {
  group('Field', () {
    test('open field with explosion', () {
      Field f = Field(0, 0);
      f.undermined();
      expect(f.open, throwsException);
    });
    test('open field without explosion', () {
      Field f = Field(0, 0);
      f.open();
      expect(f.isOpen, isTrue);
    });
    test('add no neighborhood', () {
      Field f1 = Field(0, 0);
      Field f2 = Field(1, 3);
      f1.addNeighborhood(f2);
      expect(f1.neighborhood.isEmpty, isTrue);
    });
    test('add neighborhood', () {
      Field f1 = Field(3, 3);
      Field f2 = Field(3, 4);
      Field f3 = Field(2, 2);
      Field f4 = Field(4, 4);
      f1.addNeighborhood(f2);
      f1.addNeighborhood(f3);
      f1.addNeighborhood(f4);
      expect(f1.neighborhood.length, 3);
    });

    test('mines in neighborhood', () {
      Field f1 = Field(3, 3);
      Field f2 = Field(3, 4);
      f2.undermined();
      Field f3 = Field(2, 2);
      Field f4 = Field(4, 4);
      f4.undermined();
      f1.addNeighborhood(f2);
      f1.addNeighborhood(f3);
      f1.addNeighborhood(f4);
      expect(f1.amountMinesNeighborhood, 2);
    });
  });
}
