import '../models/place.dart';

class GreatPlaces {
  final List<Place> _places = [];
  List<Place> get places => [..._places];
  int get total => _places.length;
  Place getByIndex(int index) => _places[index];
}
