import 'item_card_class.dart';

class CustomUser {
  String? profilePic;
  String userName;
  String email;
  String password;
  List<Item>? favorites;
  List<Item> addedTocart;
  final String id;
  CustomUser(
      {this.profilePic,
      required this.userName,
      required this.email,
      required this.password,
      required this.id,
      required this.addedTocart,
      this.favorites});
}

CustomUser mohannad = CustomUser(
  userName: "Mohannad Madi",
  email: "1",
  password: "1",
  id: "0",
  addedTocart: [],
  profilePic: "images/profilePic.jpeg",
);
CustomUser bosbos = CustomUser(
    addedTocart: [], userName: "Bosbos", email: "2", password: "2", id: "1");
List<CustomUser> users = [mohannad, bosbos];
