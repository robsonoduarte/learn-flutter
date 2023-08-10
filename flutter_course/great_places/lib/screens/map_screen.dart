import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadonly;
  const MapScreen({
    super.key,
    this.initialLocation = const PlaceLocation(
      latitude: -23.5503099,
      longitude: -46.6342009,
    ),
    this.isReadonly = false,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedPosition;
  final _makers = <Marker>{};

  @override
  void initState() {
    super.initState();

    _makers.add(
      Marker(
        markerId: const MarkerId('p1'),
        position: LatLng(
          widget.initialLocation.latitude,
          widget.initialLocation.longitude,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecet..'),
        actions: [
          if (!widget.isReadonly)
            IconButton(
              icon: const Icon(
                Icons.check,
              ),
              onPressed: () {
                if (_pickedPosition != null) {
                  Navigator.of(context).pop(_pickedPosition);
                }
              },
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 19,
        ),
        markers: _makers,
        onTap: widget.isReadonly ? null : _selectPosition,
      ),
    );
  }

  void _selectPosition(LatLng latLng) {
    setState(() {
      _pickedPosition = latLng;
      _makers.clear();
      _makers.add(
        Marker(
          markerId: const MarkerId('p1'),
          position: _pickedPosition!,
        ),
      );
    });
  }
}
