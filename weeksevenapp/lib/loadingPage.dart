
import 'package:flutter/material.dart';



class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('AloneInTechCity.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Quotes for Life',
                style: TextStyle(
                  fontSize: 120,
                  fontFamily: "GreatVibes",
                  color: Colors.white,
                ),
              ),
              OutlinedButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.pink[950],
                ),
                child: const Text(
                  "Start",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontFamily: "GreatVibes",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
