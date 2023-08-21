import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../custom_widgets/custom_drawer.dart';
import '../custom_widgets/item_card_widget.dart';
import '../model/item_card_class.dart';
import '../model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color((0xFF000000)),
      drawer: CustomDrawer(
        user: users[0],
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: const Text("Home"),
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
    );
  }
}
