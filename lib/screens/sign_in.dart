import 'package:course/model/user.dart';
import 'package:course/screens/home_screen.dart';
import 'package:course/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? email;
  String? password;
  late bool logged;
  SnackBar logInSuccesful = SnackBar(
      content: Container(
    child: Text("log in succeful"),
  ));
  void signIn(User user) {
    ScaffoldMessenger.of(context).showSnackBar(logInSuccesful);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen(user: user)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 10, 10, 10),
        elevation: 0,
        shadowColor: Color(0xFF555555),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 10, 10, 10), Colors.black], //
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              width: double.infinity,
              height: 70,
            ),
            Text(".\\Splash",
                style: TextStyle(color: Colors.white70, fontSize: 40)),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                cursorColor: Colors.white,
                cursorHeight: 25,
                style: TextStyle(color: Colors.white70),
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.mail),
                  suffixIconColor: Colors.grey,
                  labelStyle: TextStyle(color: Colors.white70, fontSize: 20),
                  filled: true,
                  fillColor: Color.fromARGB(255, 19, 19, 19),
                  labelText: 'Email',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextFormField(
                cursorColor: Colors.white,
                cursorHeight: 25,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                style: TextStyle(color: Colors.white70),
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.lock),
                  suffixIconColor: Colors.grey,
                  labelStyle: TextStyle(color: Colors.white70, fontSize: 20),
                  filled: true,
                  fillColor: Color.fromARGB(255, 19, 19, 19),
                  labelText: 'Password',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                ),
              ),
            ),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width - 40,
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
                onTap: () {
                  logged = users.any((element) =>
                      element.password == password && element.email == email);

                  if (logged) {
                    signIn(
                        users.firstWhere((element) => element.email == email));
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("Error"),
                              content: Text("wrong email or password"),
                            ));
                  }
                  ;
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 19, 19, 19),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                )),
            Container(
              height: 250,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an accoount? ",
                    style: TextStyle(fontSize: 15, color: Colors.white70),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpPage()));
                    },
                    child: Container(
                      child: Text("Create Account",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
