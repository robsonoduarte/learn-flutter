import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:great_places/utlis/db_util.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _places = [];
  List<Place> get places => [..._places];
  int get total => _places.length;
  Place getByIndex(int index) => _places[index];

  Future<void> loadPlaces() async {
    final data = await DBUtil.getData('places');
    _places = data
        .map(
          (item) => Place(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
              location: null),
        )
        .toList();
    notifyListeners();
  }

  void addPlaces(String title, File image) {
    final place = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );
    _places.add(place);
    DBUtil.insert(
      'places',
      {
        'id': place.id,
        'title': place.title,
        'image': place.image.path,
      },
    );
    notifyListeners();
  }
}
