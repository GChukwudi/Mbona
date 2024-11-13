import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/location.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LocationData? locationData;
  bool isLoading = false;

  Future<void> getLocation() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse(
        'http://api.ipstack.com/check?access_key=307f40de9406bf862c90ed56681ed7b5'));
  }
}
