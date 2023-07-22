const googleApiKey = 'GOOGLE_KEY';

class LocationUtil {
  static String generateLocationPreviewImage({
    required double lat,
    required double lng,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=$googleApiKey';
  }
}
