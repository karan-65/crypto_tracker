import 'package:shared_preferences/shared_preferences.dart';

class localstorage {
  static Future<bool> savetheme(String theme) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool result = await sharedPreferences.setString("theme", theme);
    return result;
  }

  static Future<String?> gettheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? currrentheme = sharedPreferences.getString("theme");
    return currrentheme;
  }
}
