import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String? username;
  String? password;
  bool isValid = false;

  bool get isInputNotEmpty => username != null && password != null;

  void userNameChanged(String? usernameInput) {
    if (usernameInput != null && usernameInput != '') {
      username = usernameInput;
    }
    notifyListeners();
  }

  void passwordChanged(String? passwordInput) {
    if (passwordInput != null && passwordInput != '') {
      password = passwordInput;
    }
    notifyListeners();
  }

  void validateUsernamePassword({
    required String usernameInput,
    required String passwordInput,
  }) {
    if (usernameInput == 'admin' && passwordInput == '4dm1n') {
      username = usernameInput;
      password = passwordInput;
      isValid = true;
    } else {
      isValid = false;
    }
    notifyListeners();
  }
}