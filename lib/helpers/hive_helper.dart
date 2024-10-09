import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveHelper {
  static const loginKey = 'LOGIN_KEY';
  static const loginBox = 'LOGIN_BOX';
  static const token = 'TOKEN';
  static const KEY_BOX_APP_LANGUAGE = "KEY_BOX_APP_LANGUAGE";

  static void setValueLoginBox() {
    Hive.box(loginBox).put(loginBox, true);
  }

  static bool checkLoginValue() {
    if (Hive.box(loginBox).isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static void setToken(String tokenParam) {
    Hive.box(token).put(token, tokenParam);
  }

  static String? getToken() {
    if (Hive.box(token).isNotEmpty) {
      return Hive.box(token).get(
        token,
      );
    }
    return null;
  }

static Future<void> deleteToken() async {
  final box = Hive.box(token); // Access the box that stores the token
  await box.delete(token); // Delete the token
  // Optionally: delete the login state as well
  final loginBox = Hive.box('LOGIN_BOX');
  await loginBox.delete(loginKey); // Remove the login state
}
 static void setLanguage(String langCode) async {
    Hive.box(KEY_BOX_APP_LANGUAGE).put(KEY_BOX_APP_LANGUAGE, langCode);
  }

  static String? getLanguage() {
    return Hive.box(KEY_BOX_APP_LANGUAGE).get(KEY_BOX_APP_LANGUAGE);
  }
}
