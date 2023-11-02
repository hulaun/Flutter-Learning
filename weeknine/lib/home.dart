import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weeknine/film.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<Film> films = [
    Film(name: "Citizen Kane",author: "Orson Welles",yearReleased: 1941),
    Film(name: "The Shawshank Redemption",author:  "Frank Darabont",yearReleased:1994),
    Film(name: "Pulp Fiction",author:  "Quentin Tarantino",yearReleased: 1994),
    Film(name: "The Godfather",author:  "Francis Ford Coppola",yearReleased: 1972)
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: films.length,
        itemBuilder: (context, index) {
          return OutlinedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/film',arguments: films[index]);
            },
            child: ListTile(
              trailing: Text(
                films[index].author
              ),
              leading: Text(
                films[index].name
              ),
            ),
          );
        },
      ),
    );
  }
}

