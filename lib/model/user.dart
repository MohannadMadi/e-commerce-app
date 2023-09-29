import 'item_card_class.dart';

class CustomUser {
  String? profilePic;
  String userName = '';
  String email;
  List<Item>? favorites;
  List<Item> addedTocart;
  final String id;
  CustomUser(
      {this.profilePic,
      required this.userName,
      required this.email,
      required this.id,
      required this.addedTocart,
      this.favorites});
}
