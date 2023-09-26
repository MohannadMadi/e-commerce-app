import 'package:course/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();
  String email = '';
  String reEnteredPassword = '';
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey();
//--validation--//
  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  bool validPassword = false;

  signUp(String email, bool validPassword) {
    validateEmail(email) && validPassword
        ? _firebaseAuthServices.signUp(email, passwordController.text)
        : showDialog(
            context: context,
            builder: (context) {
              return Container(
                child: Center(
                  child: Text(validPassword
                      ? "Invalid Email"
                      : validateEmail(email)
                          ? "Invalid Password"
                          : "Invalid Email and Password"),
                ),
              );
            });
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
                cursorHeight: 25,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  suffixIconColor: Colors.grey,
                  labelStyle: TextStyle(color: Colors.white70, fontSize: 20),
                  filled: true,
                  fillColor: Color.fromARGB(255, 19, 19, 19),
                  labelText: 'Username',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
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
                    validator: (email) {},
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    cursorColor: Colors.white,
                    cursorHeight: 25,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.mail),
                      suffixIconColor: Colors.grey,
                      labelStyle:
                          TextStyle(color: Colors.white70, fontSize: 20),
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
                    controller: passwordController,
                    cursorColor: Colors.white,
                    cursorHeight: 25,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.lock),
                      suffixIconColor: Colors.grey,
                      labelStyle:
                          TextStyle(color: Colors.white70, fontSize: 20),
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
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextFormField(
                cursorColor: Colors.white,
                cursorHeight: 25,
                onChanged: (value) {
                  setState(() {
                    reEnteredPassword = value;
                  });
                },
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.lock),
                  suffixIconColor: Colors.grey,
                  labelStyle: TextStyle(color: Colors.white70, fontSize: 20),
                  filled: true,
                  fillColor: Color.fromARGB(255, 19, 19, 19),
                  labelText: 'Re_Enter Password',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlutterPwValidator(
                defaultColor: Colors.white70,
                failureColor: Colors.red.shade800,
                successColor: Colors.green.shade800,
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
            InkWell(
                onTap: () {
                  reEnteredPassword == passwordController.text
                      ? signUp(email, validPassword)
                      : showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              child:
                                  Center(child: Text("Password not matching")),
                            );
                          });
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
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
