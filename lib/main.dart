import 'package:course/services/firebase_options.dart';
import 'package:course/screens/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'custom_widgets/item_card_widget.dart';
import 'model/item_card_class.dart';
import 'screens/home_screen.dart';
import 'services/firebase_options.dart';

TextStyle big = TextStyle(color: Colors.red, fontSize: 50);
TextStyle small = TextStyle(color: Colors.green, fontSize: 20);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SignInPage(),
      ),
    );
  }
}
