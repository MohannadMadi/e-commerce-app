import 'package:flutter/material.dart';

class DisplayFunctions {
  //*Use when displaying errorMessages
  showError(String errorMessage, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      content: Text(
        errorMessage,
        style: TextStyle(color: Colors.red[900]),
      ),
    ));
  }

  //*Use on function succes
  showSucces(String succesMessage, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(succesMessage, style: TextStyle(color: Colors.green[900])),
    ));
  }
}
