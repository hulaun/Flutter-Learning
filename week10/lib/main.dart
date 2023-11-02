import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //ui
  Color textColor= Colors.black;

  Color buttonColor= Colors.pink;
  Color buttonTextColor= Colors.white;


  //data
  final TextEditingController controller = TextEditingController();
  Random rng = Random();
  String theChosen="";
  List<String> rests = [
    "Phở bò",
    'Pizza Margherita',
    'Chicken Tikka Masala',
    'Sushi',
    'Tacos',
    "Bún",
    "Bò né"
  ];
  String chooseRandomFood(){
    if(rests.isEmpty){
      return "No restaurant food found!";
    }else{
      return rests[rng.nextInt(rests.length)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "What do you want to eat?",
                style: TextStyle(
                    color: textColor,
                    fontSize: 24
                ),
              ),
              Text(
                theChosen,
                style: TextStyle(
                    color: textColor,
                    fontSize: 48
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      theChosen=chooseRandomFood();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: buttonTextColor,
                      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  ),
                  child: Text(
                      "Pick Restaurant"
                  )
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15)
                )
              ),
              builder: (BuildContext context) {
                return Container(
                  height: 250, // This makes the window take up half the screen height.
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          child:Text(
                              "Add new Food"
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            foregroundColor: buttonTextColor,
                            padding: EdgeInsets.symmetric(vertical: 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            )
                          ),
                          onPressed:(){
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context){
                                return Column(
                                  children: [
                                    TextField(
                                      controller: controller,
                                      decoration: InputDecoration(
                                        hintText: "Enter food",
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: (){
                                        setState(() {
                                          rests.add(controller.text);
                                          Navigator.pop(context);
                                          controller.clear();
                                        });
                                      },
                                        child: Text("Add")
                                    )
                                  ],
                                );
                              }
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          child: Text(
                            "List of Food"
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              foregroundColor: buttonTextColor,
                              padding: EdgeInsets.symmetric(vertical: 25),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                          onPressed:() {
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15)
                                  )
                              ),
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 2,
                                  // This makes the window take up half the screen height.
                                  child: ListView.builder(
                                    itemCount: rests.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return Card(
                                        margin: EdgeInsets.all(8),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(rests[index]),
                                              IconButton(
                                                icon: Icon(Icons.delete),
                                                color: Colors.red,
                                                onPressed: () {
                                                  setState(() {
                                                    rests.removeAt(index);
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }
                        ),
                      )
                    ],
                  )
                );
              },
            );
          },
          backgroundColor: buttonColor,
          child: Icon(Icons.menu),
        ),
      )),
    );
  }
}
