import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/place.dart';

class OpenTripMapService {
  final String _apiKey = dotenv.env['API_KEY'] ?? '';

  Future<List<Place>> fetchPlaces(double lat, double lon) async {
    final response = await http.get(
      Uri.parse(
          'https://api.opentripmap.com/0.1/en/places/radius=5000&lon=$lon&lat=$lat&apiKey=$_apiKey'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final places = (data['features'] as List)
          .map((item) => Place.fromJson(item['properties']))
          .toList();
      return places;
    } else {
      throw Exception('Failed to load places');
    }
  }
}
