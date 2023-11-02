import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weeksevenapp/quote.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Quote> _quotes=[];
  Future<List<Quote>> fetchQuotes() async {
    final response = await rootBundle.loadString('assets/quotes.json');
    final map = await  jsonDecode(response)["quotes"] as List<dynamic>;
    _quotes = map.map((e) => Quote.fromJson(e)).toList();
    return _quotes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E3B3),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          height: 120,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[
                  Colors.redAccent,
                  Colors.orangeAccent,
                ],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: ListTile(
                title: const Text(
                  "Choose a tag",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
                trailing: IconButton(
                  icon: const  Icon(
                    Icons.search,
                    size: 26,
                  ),
                  color: Colors.black,
                  onPressed: (){},
                ),
              ),
            ),
          ),
        ),
      ),
      body:Column(
        children: [
          AspectRatio(
            aspectRatio: 1.9,
            child: Container(
              child: FutureBuilder<List<Quote>>(
                  future: fetchQuotes(),
                  builder: (BuildContext context, AsyncSnapshot<List<Quote>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Something went wrong!'));
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                tileColor: const Color(0xFFF2A413),
                                textColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                leading: Text(snapshot.data![index].quoteStatement!),
                                title: Text(
                                  snapshot.data![index].author!,
                                  textAlign: TextAlign.end,

                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
            ),
          ),
          const Divider(
            color: Color(0xFFD99F59),
            thickness: 4,
          ),
          Container(

          ),
        ],
      ),
    );
  }
}

