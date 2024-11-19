import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import '../models/place.dart';
import '../services/geoapi_service.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _places = [];
  Position? _userLocation;

  List<Place> get places => _places;
  Position? get userLocation => _userLocation;

  Future<void> fetchUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied. Cannot access location.');
    }

    // Get the user's current position
    _userLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    notifyListeners();
  }

  Future<void> fetchPlaces() async {
    final service = GeoapiService();
    if (_userLocation != null) {
      try {
        _places = await service.fetchPlaces(
          _userLocation!.latitude,
          _userLocation!.longitude,
        );
        notifyListeners();
      } catch (e) {
        // ignore: avoid_print
        print('Error fetching places: $e');
      }
    } else {
      throw Exception('User location is not available.');
    }
  }
}
