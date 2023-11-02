import 'package:flutter/material.dart';
import 'package:myapp/InformationWidget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final TextStyle numberStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  final TextStyle textStyle = const TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  RegExp regex = RegExp(r'^[-+]?\d+(\.\d+)?$');

  late double totalBillTemp=0;
  late double tipPercentageTemp=0;
  late int splitTemp=0;
  late double totalBill=0;
  late double tipPercentage=0;
  late int split=0;

  final Color selectedColor = Colors.pink;
  final Color unselectedColor = Colors.white10;

  final _mesKey = GlobalKey<ScaffoldMessengerState>();
  final _formKey = GlobalKey<FormState>();

  int index = -1;
  List<double> choice = [0.1,0.15,0.2];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _mesKey,
      title: 'Bill Calculator',
      home: Scaffold(
        // resizeToAvoidBottomInset: false,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black26,
                ),
                child: Text('Menu'),
              ),
              ListTile(
                title: const Text('Nhan la best'),
                onTap: () {
                  // Add your code here
                },
              ),
              ListTile(
                title: const Text('Nhan rac ruoi'),
                onTap: () {
                  // Add your code here
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                child: ListTile(
                  leading: Builder(
                    builder: (context) => IconButton(
                        onPressed: (){
                          Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      )
                    ),
                  ),
                  trailing: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white10,
                ),
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                width: 250,
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          "PER PERSON",
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      CustomInfo(
                        subBill: totalBill,
                        tipPercentage: tipPercentage,
                        split: split,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white10,
                ),
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                width: 250,
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      CustomInfo(
                        subBill: totalBill,
                        tipPercentage: tipPercentage,
                        split: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 50,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: index==0?selectedColor:unselectedColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            index=0;
                            tipPercentageTemp=0.1;
                          });
                        },
                        child: Text(
                          '10%',style: textStyle,
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 50,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: index==1?selectedColor:unselectedColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            index=1;
                            tipPercentageTemp=0.15;
                          });
                        },
                        child: Text(
                          '15%',style: textStyle,
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 50,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: index==2?selectedColor:unselectedColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            index=2;
                            tipPercentageTemp=0.2;
                          });
                        },
                        child: Text(
                          '20%',style: textStyle,
                        )
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: SizedBox(
                  height: 20,
                  width: 100,
                  child: Text("TOTAL AMOUNT",
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                child: Form(
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text("\$",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: SizedBox(
                            width: 60,
                            child: TextFormField(
                              style: textStyle,
                              decoration: InputDecoration(
                                hintText: "Input amount",
                                hintStyle: textStyle
                              ),
                              validator: (value) {
                                if (value == null || !regex.hasMatch(value)) {
                                  return "Please enter number";
                                }
                                return null;
                              },
                              //2
                              onChanged: (value) {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    Form.of(primaryFocus!.context!).save();
                                  });
                                }
                              },
                              onSaved: (String? value) {
                                if (value != null) {
                                  totalBillTemp = double.parse(value);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 30, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // _mesKey.currentState!.showSnackBar(
                                //   const SnackBar(content: Text("Valid")),
                                // );
                                setState(() {
                                  totalBill = totalBillTemp;
                                  tipPercentage = tipPercentageTemp;
                                  split = splitTemp;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                              )
                            ),
                            child: const Text("Calculate"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: SizedBox(
                  height: 20,
                  width: 100,
                  child: Text("SPLIT",
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 20,
                    child: FloatingActionButton(
                      backgroundColor: Colors.pink,
                      onPressed: () {
                        setState(() {
                          splitTemp--;
                        });
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_outlined,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      splitTemp.toString(),
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: FloatingActionButton(
                      backgroundColor: Colors.pink,
                      onPressed: () {
                        setState(() {
                          splitTemp++;
                        });
                      },
                      child: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
