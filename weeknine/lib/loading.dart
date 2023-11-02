import 'package:flutter/material.dart';
import 'package:weeknine/home.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void justForNothing()async{
    await Future.delayed(const Duration(seconds: 1));
    if(mounted){
      Navigator.push(
        context,
        PageRouteBuilder<HomeScreen> (
          pageBuilder: (context,animation, secondaryAnimation){
            return const HomeScreen();
          },
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );
    }
  }

  /*RotationTransition(
  turns: Tween(begin: 0.0, end: 1.0).animate(animation),
  child: child,
  );*/

  /*ScaleTransition(
  scale: Tween(begin: 1.0, end: 0.5).animate(animation),
  child: child,
  );*/

  /*SlideTransition(
  position: Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
      .animate(animation),
  child: child,
  );*/


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      justForNothing();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Week 9",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}

