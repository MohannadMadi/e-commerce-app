import 'dart:ffi';
import 'dart:io';

import 'package:course/model/user.dart';
import 'package:course/screens/home_screen.dart';
import 'package:course/screens/authentication/sign_up.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:course/services/firebase_auth_services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:connectivity/connectivity.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool loading = false;
  String? email = '';
  String? password = '';
  late bool logged;
  SnackBar logInSuccesful = SnackBar(
      content: Container(
    child: Text("log in succeful"),
  ));
  FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();

// Check connection
  Future<bool> isConnectedToInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  _showError(String errorMessage) {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: Container(
                child: Text(errorMessage),
              ),
            ));
  }

  // validation
  bool validateEmail(String email) {
    return EmailValidator.validate(email);
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
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 10, 10, 10), Colors.black], //
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                          labelStyle:
                              TextStyle(color: Colors.white70, fontSize: 20),
                          filled: true,
                          fillColor: Color.fromARGB(255, 19, 19, 19),
                          labelText: 'Email',
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
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
                          labelStyle:
                              TextStyle(color: Colors.white70, fontSize: 20),
                          filled: true,
                          fillColor: Color.fromARGB(255, 19, 19, 19),
                          labelText: 'Password',
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
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
                    //!signInButton
                    InkWell(
                        onTap: () async {
                          if (validateEmail(email!)) {
                            setState(() {
                              loading = true;
                            });
                            if (await isConnectedToInternet()) {
                              dynamic customUser = await _firebaseAuthServices
                                  .signIn(email, password, context);
                              setState(() {
                                loading = false;
                              });
                              if (customUser != null) {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => HomeScreen(
                                              user: customUser,
                                            )));
                              }
                            } else {
                              setState(() {
                                loading = false;
                              });
                              _showError("no internet");
                            }
                          } else {
                            _showError("Invalid Email");
                          }
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
                            style:
                                TextStyle(fontSize: 15, color: Colors.white70),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                            },
                            child: Container(
                              child: Text("Create Account",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
          loading
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black87,
                  child: Center(
                    child: LoadingAnimationWidget.prograssiveDots(
                        color: Colors.white, size: 80),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
