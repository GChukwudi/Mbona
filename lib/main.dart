import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/home.dart';
import 'providers/places_provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env"); // Ensure .env file exists
  runApp(const Mbano());
}

class Mbano extends StatelessWidget {
  const Mbano({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlacesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mbano',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        home: const Home(),
      ),
    );
  }
}
