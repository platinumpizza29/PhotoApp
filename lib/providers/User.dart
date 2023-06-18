// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

import 'package:photoapp/Pages/HomePage.dart';
import 'package:photoapp/Pages/LoginPage.dart';

class User with ChangeNotifier {
  late String _user;

  String get user => _user;

  setUser(String user) {
    _user = user;
    notifyListeners();
  }
}
