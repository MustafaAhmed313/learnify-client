import 'package:hive/hive.dart';

class HiveHelper {
  static const loginKey = 'LOGIN_KEY';
  static const loginBox = 'LOGIN_BOX';
  static const token = 'TOKEN';

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
}


