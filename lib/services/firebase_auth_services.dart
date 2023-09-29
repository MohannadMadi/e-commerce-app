import 'package:course/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:course/model/display_functions.dart';

class FirebaseAuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DisplayFunctions displayFunctions = DisplayFunctions();
//error display

// CreateCustomUserFromFirebaseUser

  dynamic _createCustomUser(
      User firebaseUser, String userName, String password) {
    return CustomUser(
        userName: userName,
        email: firebaseUser.email!,
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
  Future<dynamic> signIn(email, passWord, context) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: passWord);
      User firebaseUser = userCredential.user!;
      CustomUser customUser =
          _createCustomUser(firebaseUser, firebaseUser.displayName!, passWord);

      debugPrint(userCredential.toString());
      return customUser;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "INVALID_LOGIN_CREDENTIALS":
          displayFunctions.showError(
              "Please enter a valid email and password!", context);
          break;
        case "too-many-requests":
          displayFunctions.showError(
              "Account disabled temporarily, try reseting your password or try again later.",
              context);
          break;
        default:
          debugPrint(error.code);
      }
      debugPrint("----------------------------------------${error.code}");
    }
    // SignInAnon
  }
}
