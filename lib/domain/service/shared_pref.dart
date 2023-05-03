import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

class SharedPrefHelper {
  static Future getSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }
}
