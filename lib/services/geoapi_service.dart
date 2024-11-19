import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/place.dart';

class GeoapiService {
  final String _apiKey = dotenv.env['API_KEY'] ?? '';

  Future<List<Place>> fetchPlaces(double lat, double lon) async {
    final String url =
        'https://api.geoapify.com/v1/places?categories=tourism.sights&filter=circle:$lon,$lat,5000&limit=10&apiKey=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Parse the API feed into a list of `Place` objects
        final places = (data['features'] as List)
            .map((item) => Place.fromJson(item['properties']))
            .toList();
        return places;
      } else {
        throw Exception(
            'Failed to load places: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error fetching places: $e');
    }
  }

  Future<Place> fetchPlaceDetails(String query) async {
    final String url =
        'https://api.geoapify.com/v1/geocode/search?text=$query&apiKey=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['features'] != null && data['features'].isNotEmpty) {
          final placeData = data['features'][0]['properties'];
          return Place.fromJson(placeData);
        } else {
          throw Exception('No place found for the query.');
        }
      } else {
        throw Exception(
            'Failed to fetch place details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching place details: $e');
    }
  }
}
