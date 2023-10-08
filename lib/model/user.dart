import 'dart:io';

import 'package:flutter/material.dart';

import 'item_card_class.dart';

class CustomUser extends ChangeNotifier {
  File? profilePic;
  String? userName = '';
  String? email;
  List<Item>? favorites;
  List<Item>? addedTocart;
  final String? id;
  CustomUser(
      {this.profilePic,
      this.userName,
      this.email,
      this.id,
      this.addedTocart,
      this.favorites});

  updateProfielePic(File picFile) {
    profilePic = picFile;
    notifyListeners();
  }
}
