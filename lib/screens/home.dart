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
              Color(0xfff6c85b),
              Color(0xffffffff),
            ],
            begin: Alignment.topCenter,
            end: Alignment.center,
          )),
        ),
      ]),
    );
  }
}
