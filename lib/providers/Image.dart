import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Images with ChangeNotifier {
  Future<List<String>> getUserImages() async {
    var uri = dotenv.env["GET_USER_IMAGES"];
    var response = await Dio().get(uri!);
    notifyListeners();
    return response.data;
  }

  Future<List<String>> getAllImages() async {
    var uri = dotenv.env["GET_ALL_IMAGES"];
    var response = await Dio().get(uri!);
    notifyListeners();
    return response.data;
  }
}
