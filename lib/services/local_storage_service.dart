import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static void storeUserData({
    required String username,
    required String password,
  }) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
// Save an String value to 'action' key.
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  static Future<String?> readUser() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString('username');
    return username;
  }

  static void removeUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("username");
    await prefs.remove("password");
  }
}
