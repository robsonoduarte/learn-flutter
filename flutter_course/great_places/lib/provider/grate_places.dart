import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _places = [];
  List<Place> get places => [..._places];
  int get total => _places.length;
  Place getByIndex(int index) => _places[index];

  void addPlaces(String title, File image) {
    final place = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );
    _places.add(place);
    notifyListeners();
  }
}
