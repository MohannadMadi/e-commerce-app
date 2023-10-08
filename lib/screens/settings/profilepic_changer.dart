import 'dart:io';

import 'package:course/model/user.dart';
import 'package:course/services/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePicChanger extends StatefulWidget {
  final CustomUser user;
  const ProfilePicChanger({super.key, required this.user});

  @override
  State<ProfilePicChanger> createState() => _ProfilePicChangerState();
}

class _ProfilePicChangerState extends State<ProfilePicChanger> {
  @override
  void initState() {
    User firebaseUser = firebaseAuthServices.currentUser;
    super.initState();
  }

  XFile? image;
  FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();
  Future pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = pickedFile;
    User firebaseUser = await firebaseAuthServices.currentUser!;
    await firebaseUser.updatePhotoURL(image!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickImage,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Center(
            child: context.watch<FirebaseAuthServices>().currentUser == null
                ? const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 19, 19, 19),
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
                    foregroundImage: FileImage(File(context
                        .watch<FirebaseAuthServices>()
                        .currentUserPhoto)),
                  ),
          ),
        ],
      ),
    );
  }
}
