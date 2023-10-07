import 'package:course/model/user.dart';
import 'package:course/screens/settings/profilepic_changer.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final CustomUser user;

  const Settings({super.key, required this.user});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
        ),
        backgroundColor: Colors.black,
        elevation: 2,
        shadowColor: Color(0xFF555555),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [ProfilePicChanger(user: widget.user)],
        ),
      ),
    );
  }
}