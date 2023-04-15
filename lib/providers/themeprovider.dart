import 'package:crypto_tracker/modals/localstorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themeprovider with ChangeNotifier {
  late ThemeMode themeMode;
  Themeprovider(String theme) {
    if (theme == "light") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
  }
  void toggleTheme() async {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      await localstorage.savetheme("dark");
    } else {
      themeMode = ThemeMode.light;
      await localstorage.savetheme("light");
    }
    notifyListeners();
  }
}
