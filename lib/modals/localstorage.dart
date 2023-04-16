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

  static Future<bool> addfav(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> favirotes = sharedPreferences.getStringList("favorites") ?? [];
    favirotes.add(id);
    return await sharedPreferences.setStringList("favorites", favirotes);
  }

  static Future<bool> removefav(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> favirotes = sharedPreferences.getStringList("favorites") ?? [];
    favirotes.remove(id);
    return await sharedPreferences.setStringList("favorites", favirotes);
  }

  static Future<List<String>> fetchfav() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList("favorites") ?? [];
  }
}
