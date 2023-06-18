import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light(useMaterial3: true);
  var themeValue = false;

  ThemeData get currentTheme => _currentTheme;

  void changeTheme(ThemeData newTheme) {
    _currentTheme = newTheme;
    notifyListeners();
  }
}
