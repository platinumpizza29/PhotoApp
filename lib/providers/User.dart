// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

import 'package:photoapp/Pages/HomePage.dart';
import 'package:photoapp/Pages/LoginPage.dart';

class User with ChangeNotifier {
  var user;

  UserAuthentication() async {
    if (user == null) {
      notifyListeners();
      return LoginPage();
    } else {
      notifyListeners();
      return HomePage();
    }
  }
}
