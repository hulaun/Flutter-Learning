import 'package:flutter/material.dart';
import 'package:weeknine/film.dart';
class FilmScreen extends StatefulWidget {
  const FilmScreen({super.key});

  @override
  State<FilmScreen> createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> {

  @override
  Widget build(BuildContext context) {
    final Film film = ModalRoute
        .of(context)!
        .settings
        .arguments as Film;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text(film.name),
      ),
      body: Center(
        child: Text(
          'Director: ${film.author}, Year released: ${film.yearReleased}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
