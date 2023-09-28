import 'package:connectivity/connectivity.dart';
import 'package:course/screens/home_screen.dart';
import 'package:course/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool loading = false;

  FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();
  String userName = '';
  String email = '';
  String reEnteredPassword = '';
  TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;
  bool hideReEnterPassword = true;
  final _formKey = GlobalKey();
//--validation--//
  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  bool validPassword = false;

  signUp(String userName, String email, bool validPassword) {
    if (validateEmail(email) && validPassword) {
      return _firebaseAuthServices.signUp(
          userName, email, passwordController.text);
    } else {
      _showError(validPassword
          ? "Invalid Email"
          : validateEmail(email)
              ? "Invalid Password"
              : "Invalid Email and Password");
    }
  }

  //!checking connection
  Future<bool> isConnectedToInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  void _showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? SizedBox(
            width: 80,
            child: Center(
              child: LoadingAnimationWidget.prograssiveDots(
                  color: Colors.white, size: 80),
            ),
          )
        : Scaffold(
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: 20,
                      ),
                      Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 19, 19, 19),
                              borderRadius: BorderRadius.circular(70)),
                          child: const Icon(
                            Icons.person,
                            size: 120,
                            color: Colors.grey,
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: TextFormField(
                          cursorColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              userName = value;
                            });
                          },
                          cursorHeight: 25,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: Colors.grey,
                            labelStyle:
                                TextStyle(color: Colors.white70, fontSize: 20),
                            filled: true,
                            fillColor: Color.fromARGB(255, 19, 19, 19),
                            labelText: 'Username',
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
                        height: 20,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(children: [
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
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.mail),
                                prefixIconColor: Colors.grey,
                                labelStyle: TextStyle(
                                    color: Colors.white70, fontSize: 20),
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
                              obscureText: hidePassword,
                              controller: passwordController,
                              cursorColor: Colors.white,
                              cursorHeight: 25,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                prefixIconColor: Colors.grey,
                                suffix: InkWell(
                                  onTap: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey,
                                  ),
                                ),
                                labelStyle: TextStyle(
                                    color: Colors.white70, fontSize: 20),
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
                        ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: TextFormField(
                          obscureText: hideReEnterPassword,
                          cursorColor: Colors.white,
                          cursorHeight: 25,
                          onChanged: (value) {
                            setState(() {
                              reEnteredPassword = value;
                            });
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            prefixIconColor: Colors.grey,
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  hideReEnterPassword = !hideReEnterPassword;
                                });
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                color: Colors.grey,
                              ),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.white70, fontSize: 20),
                            filled: true,
                            fillColor: Color.fromARGB(255, 19, 19, 19),
                            labelText: 'Re_Enter Password',
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
                        height: 20,
                      ),
                      //------validation------//
                      FlutterPwValidator(
                          defaultColor: Colors.white70,
                          failureColor: Colors.red.shade800,
                          successColor: Colors.green.shade900,
                          width: MediaQuery.of(context).size.width - 40,
                          height: 180,
                          minLength: 8,
                          uppercaseCharCount: 1,
                          lowercaseCharCount: 1,
                          specialCharCount: 1,
                          onSuccess: () {
                            debugPrint("success");
                            setState(() {
                              validPassword = true;
                            });
                          },
                          onFail: () {
                            debugPrint("fail");
                            setState(() {
                              validPassword = false;
                            });
                          },
                          controller: passwordController),
                      SizedBox(
                        height: 40,
                      ),
                      //! signInbutton
                      InkWell(
                          onTap: () async {
                            if (await isConnectedToInternet()) {
                              if (reEnteredPassword ==
                                  passwordController.text) {
                                setState(() {
                                  loading = true;
                                });
                                dynamic customUser = await signUp(
                                    userName, email, validPassword);
                                setState(() {
                                  loading = false;
                                });
                                if (customUser != null) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen(user: customUser)));
                                }
                              } else {
                                setState(() {
                                  loading = false;
                                });
                                _showError("Password not matching");
                              }
                            } else {
                              _showError("No Internet connection");
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
                              "SIGN UP",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28),
                            ),
                          )),
                    ]),
              ),
            ),
          );
  }
}
