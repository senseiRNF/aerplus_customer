import 'package:shared_preferences/shared_preferences.dart';

class LocalSPKeys {
  static String accessTokenKey = 'access_token';
  static String userIdKey = 'user_id';
  static String nameKey = 'name';
  static String usernameKey = 'username';
  static String emailKey = 'email';
}

class LocalSharedPreferences {
  static Future<SharedPreferences> _init() async {
    SharedPreferences sPrefs = await SharedPreferences.getInstance();

    return sPrefs;
  }

  static Future<String?> readKey(String key) async {
    String? result;

    await _init().then((sPrefs) {
      result = sPrefs.getString(key);
    });

    return result;
  }

  static Future<bool> writeKey(String key, String data) async {
    bool result = false;

    await _init().then((sPrefs) async {
      await sPrefs.setString(key, data).then((_) {
        result = true;
      });
    });

    return result;
  }

  static Future<bool> removeKey(String key) async {
    bool result = false;

    await _init().then((sPrefs) async {
      await sPrefs.remove(key).then((_) {
        result = true;
      });
    });

    return result;
  }

  static Future<bool> removeAllKey() async {
    bool result = false;

    await _init().then((sPrefs) async {
      await sPrefs.clear().then((_) {
        result = true;
      });
    });

    return result;
  }
}