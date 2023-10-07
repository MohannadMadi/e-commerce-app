// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:course/screens/authentication/sign_in.dart';
import 'package:course/screens/home_screen.dart';
import 'package:course/screens/settings/settings_screen.dart';
import 'package:course/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';

import 'package:course/model/user.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import 'custom_tile.dart';

class CustomDrawer extends StatefulWidget {
  final CustomUser user;
  CustomDrawer({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                color: const Color.fromARGB(255, 12, 12, 12),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        context.watch<CustomUser>().profilePic == null
                            ? const CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 19, 19, 19),
                                radius: 45,
                                child: Icon(
                                  Icons.person,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 45,
                                foregroundImage: FileImage(
                                  context.read<CustomUser>().profilePic!,
                                ),
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            widget.user.userName!,
                            style: const TextStyle(
                                fontSize: 35, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              CustomListTile(
                icon: const Icon(
                  Icons.home,
                  size: 45,
                  color: Colors.deepPurple,
                ),
                text: "Home Page",
                pageRoute: HomeScreen(
                  user: widget.user,
                ),
              ),
              CustomListTile(
                text: "Settings",
                icon: const Icon(
                  Icons.settings,
                  size: 45,
                  color: Colors.deepPurple,
                ),
                pageRoute: Settings(
                  user: widget.user,
                ),
              ),
              CustomListTile(
                  text: "Sign Out",
                  onpressed: () {
                    setState(() {
                      loading = true;
                    });
                    firebaseAuthServices.signOut(context);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SignInPage()));
                    setState(() {
                      loading = false;
                    });
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                    size: 45,
                    color: Colors.deepPurple,
                  ))
            ],
          ),
        ),
        loading
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black87,
                child: Center(
                  child: LoadingAnimationWidget.prograssiveDots(
                      color: Colors.white, size: 80),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
