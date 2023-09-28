import 'package:course/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

// CreateCustomUserFromFirebaseUser

  dynamic _createCustomUser(
      User firebaseUser, String userName, String password) {
    return CustomUser(
        userName: userName,
        email: firebaseUser.email!,
        password: password,
        id: firebaseUser.uid,
        addedTocart: []);
  }

// SignUp

  Future<dynamic> signUp(String userName, String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = userCredential.user!;
      firebaseUser.updateDisplayName(userName);
      CustomUser customUser =
          _createCustomUser(firebaseUser, userName, password);
      return customUser;
    } on FirebaseAuthException catch (error) {
      debugPrint("Error Signing up: ${error.code}");
    }
  }

// SignIN
  // SignInWithEmailAndPassword
  Future<dynamic> signIn(email, passWord) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: passWord);
      User firebaseUser = userCredential.user!;
      CustomUser customUser =
          _createCustomUser(firebaseUser, firebaseUser.displayName!, passWord);

      debugPrint(firebaseUser.toString());
      return customUser;
    } on FirebaseAuthException catch (error) {
      debugPrint(error.code);
    }
  }
  // SignInAnon
}
