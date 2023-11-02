
import 'package:flutter/material.dart';
import 'package:weeksevenapp/homePage.dart';
import 'package:weeksevenapp/quotePage.dart';
import 'package:weeksevenapp/loadingPage.dart';

void main() {
   runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const LoadingPage(),
      '/home': (context) => const HomePage(),
      '/quotePage': (context) => const QuotePage(),
    },
  ));
}


