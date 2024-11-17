import 'package:flutter/material.dart';
import '../models/place.dart';

class ScreenDetails extends StatelessWidget {
  final Place place;

  const ScreenDetails({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            place.name,
            style: const TextStyle(),
          ),
          const SizedBox(height: 8),
          Text(
            place.address,
            style: const TextStyle(),
          ),
          const SizedBox(height: 8),
          Text(
            'Category: ${place.kinds}',
            style: const TextStyle(),
          ),
          const SizedBox(height: 8),
          Text(
            place.description ?? 'No description available',
            style: const TextStyle(),
          )
        ]),
      ),
    );
  }
}
