import 'package:shared_preferences/shared_preferences.dart';

class PrefManage {
  static const _KEY_NAME = 'Name';
  static const _KEY_EMAIL = 'Email';
  static const _KEY_IS_LOGIN = 'Is_login';
  static const _KEY_PASSWORD = 'Password';

  static late SharedPreferences sharedPreferences;

  static Future<SharedPreferences> inti() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  static Future<bool> createAccount(
      String Name, String Email, String Password) async {
    try {
      await sharedPreferences.setString(_KEY_NAME, Name);
      await sharedPreferences.setString(_KEY_EMAIL, Email);
      await sharedPreferences.setString(_KEY_PASSWORD, Password);

      return true;
    } catch (e) {
      return false;
    }
  }

  static String getName() {
    return sharedPreferences.getString(_KEY_NAME) ?? '';
  }

  static String getEmail() {
    return sharedPreferences.getString(_KEY_EMAIL) ?? '';
  }

  static String getPassword() {
    return sharedPreferences.getString(_KEY_PASSWORD) ?? '';
  }

  static Future<bool> setLoginStatus(bool st) async {
    try {
      await sharedPreferences.setBool(_KEY_IS_LOGIN, st);
      return true;
    } catch (e) {
      return false;
    }
  }

  static getLoginStatus() {
    return sharedPreferences.getBool(_KEY_IS_LOGIN) ?? false;
  }
}
