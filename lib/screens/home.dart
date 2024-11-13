import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/location.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LocationData? locationData;

  Future<void> fetchLocation() async {
    final apiKey = dotenv.env['API_KEY'];
    final response = await http.get(
      Uri.parse('http://api.ipstack.com/check?access_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        locationData = LocationData.fromJson(data);
      });
    } else {
      throw Exception('Failed to load location data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xff44588e),
                Color(0xffffffff),
              ],
            ),
          ),
        ),
        Center(
          child: locationData == null
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Where am I?',
                        style: TextStyle(
                          fontSize: 28,
                          color: Color.fromARGB(255, 15, 20, 14),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          Text(
                            locationData!.city,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 15, 20, 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ]),
    );
  }
}
