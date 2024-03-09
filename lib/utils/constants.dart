import 'package:shared_preferences/shared_preferences.dart';

class Constants{
  static SharedPreferences? prefs;

 static Future<void> getPrefrence() async {
    Constants.prefs = await SharedPreferences.getInstance();
  }
}