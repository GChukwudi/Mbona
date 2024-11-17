import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/places_provider.dart';
import "../screens/screen_details.dart";

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<PlacesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Nearby Places'),
      ),
      body: FutureBuilder(
        future: placesProvider.fetchPlaces(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred!'),
            );
          }
          return ListView.builder(
            itemCount: placesProvider.places.length,
            itemBuilder: (context, index) {
              final place = placesProvider.places[index];
              return ListTile(
                title: Text(place.name),
                subtitle: Text(place.address),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenDetails(place: place),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
