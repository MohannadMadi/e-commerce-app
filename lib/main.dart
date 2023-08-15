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
        backgroundColor: Colors.amber[700],
        title: const Text("shop"),
      ),
      body: ItemCard(item: item1),
    ));
  }
}
