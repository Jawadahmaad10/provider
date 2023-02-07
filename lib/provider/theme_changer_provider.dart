import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  var _thememode = ThemeMode.light;
  ThemeMode get themeMode => _thememode;



  void setTheme(ThemeMode) {
    _thememode = themeMode;
    notifyListeners();
  }
}