import 'package:flutter/material.dart';
import '../screens/explore.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mbano - Explore'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Explore()),
            );
          },
          child: const Text('Explore Nearby Places'),
        ),
      ),
    );
  }
}
