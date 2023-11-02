import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late double totalBill = 0;
  late double tipPercentage = 0;
  late double tipBill = 0;
  late double bill = 0;

  RegExp regex = RegExp(r'^[-+]?\d+(\.\d+)?$');
  TextStyle tx = const TextStyle(
      color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold);

  final _mesKey = GlobalKey<ScaffoldMessengerState>();
  final _formKey = GlobalKey<FormState>();

  int _selectedIndex = 0;
  final List<bool> _pages = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _mesKey,
      home: Scaffold(
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Enter bill total",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "\$",
                    ),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        textAlign: TextAlign.center,

                        decoration: const InputDecoration(
                          hintText: "Any positive number",
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
                            totalBill = double.parse(value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                  width: 210,
                  child: Center(
                    child: ToggleButtons(
                      disabledColor: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(4),
                      selectedColor: Colors.blue[900],
                      isSelected: _pages,
                      constraints:
                          const BoxConstraints.expand(width: 60, height: 50),
                      onPressed: (int index) {
                        setState(() {
                          _pages[(index + 1) % 3] = false;
                          _pages[(index + 2) % 3] = false;
                          _pages[index] = !_pages[index];
                          _selectedIndex = index;
                          tipPercentage = (_selectedIndex == 0)
                              ? 0.1
                              : (_selectedIndex == 1)
                                  ? 0.15
                                  : 0.2;
                        });
                      },
                      children: const [
                        Text("10%"),
                        Text("15%"),
                        Text("20%"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _mesKey.currentState!.showSnackBar(
                        const SnackBar(content: Text("content")),
                      );
                      setState(() {
                        bill = totalBill * tipPercentage;
                        tipBill = totalBill - bill;
                      });
                    }
                  },
                  child: const Text("Validate"),
                ),
                SizedBox(
                  child: Container(
                    width: 200,
                    height: 100,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          totalBill.toStringAsFixed(2),
                          style: tx,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              bill.toStringAsFixed(2),
                              style: tx,
                            ),
                            Text(
                              tipBill.toStringAsFixed(2),
                              style: tx,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
