// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:localstore/localstore.dart';
import 'package:photoapp/Pages/HomePage.dart';
import 'package:photoapp/providers/User.dart';
import 'package:provider/provider.dart';

final db = Localstore.instance;

class UserAuth {
  loginWithEmailAndPassword(context, email, password) async {
    var uri = "https://reqres.in/api/login";
    var response = await Dio().post(uri, data: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      Provider.of<User>(context, listen: false).setUser(response.data);
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error while sign in..."),
        backgroundColor: CupertinoColors.destructiveRed,
      ));
    }
  }

  registerUser(context, userName, email, password) async {
    final String? uri = dotenv.env["USER_REG"];
    var response = await Dio().post(uri!,
        data: {"userId": email, "password": password, "userName": userName});
    if (response.statusCode == 409) {
      print(response.data);
      return "Error";
    } else {
      // gets new id
      final id = db.collection('todos').doc().id;
      // save the item
      db.collection('UserDetails').doc(id).set({
        'UserName': userName,
        'Email': email,
      });
      Provider.of<User>(context, listen: false).UserState(id);
      Provider.of<User>(context, listen: false).setUser(response.data);
      return "Success";
    }
  }
}
