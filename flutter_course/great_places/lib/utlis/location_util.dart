import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const googleApiKey = 'GOOGLE_KEY';

class LocationUtil {
  static String generateLocationPreviewImage({
    required double lat,
    required double lng,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=$googleApiKey';
  }

  static Future<String> getAddressFrom(LatLng position) async {
    final response = await http.get(Uri.https(
      'maps.googleapis.com',
      '/maps/api/geocode/json',
      {
        'latlng': '${position.latitude},${position.longitude}',
        'key': googleApiKey
      },
    ));
    return jsonDecode(response.body)['results'][0]['formatted_address'];
  }
}
