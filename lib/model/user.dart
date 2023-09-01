import 'dart:ffi';

import 'item_card_class.dart';

class User {
  String? profilePic;
  String userName;
  String email;
  String password;
  List<Item>? favorites;
  List<Item>? addedTocart;
  int id;
  User(
      {this.profilePic,
      required this.userName,
      required this.email,
      required this.password,
      required this.id,
      this.addedTocart,
      this.favorites});
}

User mohannad = User(
    userName: "Mohannad Madi",
    email: "1",
    password: "1",
    id: 0,
    profilePic: "images/profilePic.jpeg");
User bosbos = User(userName: "Bosbos", email: "2", password: "2", id: 1);
List<User> users = [mohannad, bosbos];
