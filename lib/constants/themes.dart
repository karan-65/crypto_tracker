import 'package:flutter/material.dart';

ThemeData lighttheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.white),
    iconTheme: IconThemeData(color: Colors.black));

ThemeData darktheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff15161a),
  appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Color(0xff15161a)),
);
