import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:great_places/utlis/location_util.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPosition;
  const LocationInput(this.onSelectPosition, {super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  void _showPreview(double lat, double lng) {
    final urlStaticMap = LocationUtil.generateLocationPreviewImage(
      lat: lat!,
      lng: lng!,
    );
    setState(() {
      _previewImageUrl = urlStaticMap;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    final location = await Location().getLocation();
    _showPreview(
      location.latitude!,
      location.longitude!,
    );
    widget.onSelectPosition(LatLng(
      location.latitude!,
      location.longitude!,
    ));
  }

  Future<void> _selectOnMap() async {
    final LatLng selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const MapScreen(),
      ),
    );
    _showPreview(
      selectedLocation.latitude!,
      selectedLocation.longitude!,
    );
    widget.onSelectPosition(selectedLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.green,
            ),
          ),
          child: _previewImageUrl == null
              ? const Text('No Location')
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: Icon(
                Icons.location_on,
                color: Theme.of(context).primaryColor,
              ),
              label: Text(
                'Location',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: Icon(
                Icons.mp,
                color: Theme.of(context).primaryColor,
              ),
              label: Text(
                'Map',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
