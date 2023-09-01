import 'dart:ffi';

import 'item_card_class.dart';

class User {
  String? profilePic;
  String userName;
  String email;
  String password;
  List<Item>? favorites;
  List<Item>? addedTocart;
  User(
      {this.profilePic,
      required this.userName,
      required this.email,
      required this.password,
      this.addedTocart,
      this.favorites});
}

User mohannad = User(
    userName: "Mohannad Madi",
    email: "1",
    password: "1",
    profilePic: "images/profilePic.jpeg");

List<User> users = [mohannad];
late List<List<String>> logInInfo = [
  [mohannad.email, mohannad.password],
];
