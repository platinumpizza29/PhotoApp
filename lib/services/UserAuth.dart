// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:photoapp/Pages/HomePage.dart';
import 'package:photoapp/providers/User.dart';
import 'package:provider/provider.dart';

final String? uri = dotenv.env["USER_REG"];

class UserAuth {
  loginWithEmailAndPassword(context, email, password) async {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => HomePage()));
  }

  registerUser(userName, email, password) async {
    var response = await Dio().post(uri!,
        data: {"userId": email, "password": password, "userName": userName});
    if (response.statusCode == 409) {
      return "Error";
    } else {
      return "Success";
    }
  }
}
