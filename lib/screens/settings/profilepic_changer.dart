import 'dart:io';

import 'package:course/model/user.dart';
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
  XFile? image;

  Future pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pickedFile;
      context.read<CustomUser>().updateProfielePic(File(image!.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickImage,
      child: Center(
        child: context.read<CustomUser>().profilePic == null
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
                foregroundImage: FileImage(
                  context.read<CustomUser>().profilePic!,
                ),
              ),
      ),
    );
  }
}
