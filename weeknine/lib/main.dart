import 'package:flutter/material.dart';
import 'package:weeknine/loading.dart';
import 'package:weeknine/home.dart';
import 'package:weeknine/film_about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => HomeScreen(),
        '/film': (context) => FilmScreen(),
      },
    );
  }
}
