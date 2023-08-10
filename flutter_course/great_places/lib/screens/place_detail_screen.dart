import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/screens/map_screen.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)!.settings.arguments as Place;
    return Scaffold(
      appBar: AppBar(
        title: Text(place!.title),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            place.location!.address!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: ElevatedButton.icon(
              icon: const Icon(
                Icons.map,
              ),
              label: const Text('Show in Map'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => MapScreen(
                    isReadonly: true,
                    initialLocation: place.location!,
                  ),
                ));
              },
            ),
          )
        ],
      ),
    );
  }
}
