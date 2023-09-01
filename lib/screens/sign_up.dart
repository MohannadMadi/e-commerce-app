import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextFormField(
                cursorColor: Colors.white,
                cursorHeight: 25,
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
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextFormField(
                cursorColor: Colors.white,
                cursorHeight: 25,
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
              height: 40,
            ),
            InkWell(
                onTap: () {
                  print("sad");
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
    ;
  }
}
