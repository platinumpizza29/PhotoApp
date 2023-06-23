// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:localstore/localstore.dart';

import 'package:photoapp/Pages/HomePage.dart';
import 'package:photoapp/Pages/LoginPage.dart';
import 'package:dio/dio.dart';

class User with ChangeNotifier {
  final db = Localstore.instance;
  late Map _user;
  late String? _id = null;

  Map get user => _user;
  String? get id => _id;

  setUser(Map user) {
    _user = user;
    notifyListeners();
  }

  UserState(String id) async {
    var user_details = await db.collection("UserDetails").doc(id).get();
    if (user_details == null) {
      return LoginPage();
    } else {
      return HomePage();
    }
  }
}
