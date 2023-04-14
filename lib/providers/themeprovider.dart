import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themeprovider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
