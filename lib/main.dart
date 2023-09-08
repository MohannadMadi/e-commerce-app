import 'package:course/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'custom_widgets/item_card_widget.dart';
import 'model/item_card_class.dart';
import 'screens/home_screen.dart';

TextStyle big = TextStyle(color: Colors.red, fontSize: 50);
TextStyle small = TextStyle(color: Colors.green, fontSize: 20);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData customTheme = ThemeData.dark()
      .copyWith(appBarTheme: AppBarTheme(backgroundColor: Colors.purple));
  bool dark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SignInPage(),
      ),
    );
  }
}
