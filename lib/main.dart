import 'package:flutter/material.dart';
import 'item_card_widget.dart';
import 'item_card_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color((0xFF000000)),
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: const Text("shop"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Wrap(
              spacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...items
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: ItemCard(item: e),
                        ))
                    .toList()
              ]),
          Row()
        ],
      )),
    ));
  }
}
