// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:course/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:course/model/user.dart';

import 'custom_tile.dart';

class CustomDrawer extends StatefulWidget {
  User user;
  CustomDrawer({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            color: Colors.blueGrey[700],
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 45,
                      foregroundImage: AssetImage(widget.user.profilePic!),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        widget.user.userName,
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          CustomListTile(
            icon: Icon(
              Icons.home,
              size: 45,
              color: Colors.blue,
            ),
            text: "Home Page",
            pageRoute: HomeScreen(),
          )
          
        ],
      ),
    );
  }
}
