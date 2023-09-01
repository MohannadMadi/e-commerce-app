import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../custom_widgets/custom_drawer.dart';
import '../custom_widgets/item_card_widget.dart';
import '../model/item_card_class.dart';
import '../model/user.dart';

class HomeScreen extends StatefulWidget {
  User user;
  HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      drawer: CustomDrawer(
        user: users[widget.user.id],
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2,
        shadowColor: Color(0xFF555555),
        title: const Text(
          ".\\Splash",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
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
