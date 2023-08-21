class User {
  String? profilePic;
  String userName;
  String email;
  String password;
  User({
    this.profilePic,
    required this.userName,
    required this.email,
    required this.password,
  });
}

User mohannad = User(
    userName: "Mohannad Madi",
    email: "mohannadmadi12@gmail.com",
    password: "imsocool",
    profilePic: "images/profilePic.jpeg");

List<User> users = [mohannad];
