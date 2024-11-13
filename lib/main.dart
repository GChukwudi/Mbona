import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mbona/screens/home.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const Mbano());
}

class Mbano extends StatelessWidget {
  const Mbano({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mbano',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      routes: const {
        // '/home': (context) => const Home(),
        // '/about': (context) => const About(),
      },
    );
  }
}
