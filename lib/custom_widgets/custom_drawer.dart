// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:course/screens/authentication/sign_in.dart';
import 'package:course/screens/home_screen.dart';
import 'package:course/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:course/model/user.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
                        widget.user.profilePic == null
                            ? CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 19, 19, 19),
                                child: const Icon(
                                  Icons.person,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                                radius: 45,
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 45,
                                foregroundImage:
                                    AssetImage(widget.user.profilePic!),
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
                pageRoute: HomeScreen(
                  user: widget.user,
                ),
              ),
              CustomListTile(
                  text: "Sign Out",
                  onpressed: () async {
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
                  icon: Icon(
                    Icons.logout_outlined,
                    size: 45,
                    color: Colors.blue,
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
            : SizedBox(),
      ],
    );
  }
}
