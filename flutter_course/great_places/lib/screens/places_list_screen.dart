import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/utlis/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.placeForm);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: context.read<GreatPlaces>().loadPlaces(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: const Center(
                      child: Text('No Great Places'),
                    ),
                    builder: (context, greatPlaces, child) {
                      Widget? widget = greatPlaces.total == 0
                          ? child
                          : ListView.builder(
                              itemCount: greatPlaces.total,
                              itemBuilder: (context, index) {
                                final place = greatPlaces.getByIndex(index);
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: FileImage(place.image),
                                  ),
                                  title: Text(place.title),
                                  onTap: () {},
                                );
                              },
                            );
                      return widget!;
                    },
                  ),
      ),
    );
  }
}
