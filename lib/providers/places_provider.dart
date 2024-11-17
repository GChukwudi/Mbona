import 'package:flutter/material.dart';
import '../models/place.dart';
import '../services/opentripmap_service.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places => _places;

  Future<void> fetchPlaces() async {
    final service = OpenTripMapService();
    _places = await service.fetchPlaces(37.7749, -122.4194);
    notifyListeners();
  }
}
