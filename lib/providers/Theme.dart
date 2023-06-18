import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light(useMaterial3: true);
  bool _themeValue = false;

  bool get themeValue => _themeValue;
  ThemeData get currentTheme => _currentTheme;

  void changeTheme(ThemeData newTheme) {
    _currentTheme = newTheme;
    notifyListeners();
  }

  void setThemeValue(bool value) {
    _themeValue = value;
    notifyListeners();
  }
}
