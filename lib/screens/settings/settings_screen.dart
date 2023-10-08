import 'package:course/model/user.dart';
import 'package:course/screens/home_screen.dart';
import 'package:course/screens/settings/profilepic_changer.dart';
import 'package:course/screens/settings/settings_section.dart';
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
        leading: BackButton(onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeScreen(
                    user: widget.user,
                  )));
        }),
        title: const Text(
          "Settings",
        ),
        backgroundColor: Colors.black,
        elevation: 2,
        shadowColor: const Color(0xFF555555),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsSection(children: [
              Row(
                children: [
                  ProfilePicChanger(user: widget.user),
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }
}
