import 'package:shared_preferences/shared_preferences.dart';

/// A utility class for managing SharedPreferences.
class PreferencesManager {
  static SharedPreferences? sharedPreferences;

  /// Initializes SharedPreferences.
  static Future<void> setupSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Clears all data stored in SharedPreferences.
  static Future<void> clearSharedPreferences() async {
    if (sharedPreferences != null) {
      await sharedPreferences?.clear();
    }
  }

  /// Sets a string value in SharedPreferences.
  static Future<void> setString(String data, String key) async {
    await sharedPreferences?.setString(key, data);
  }

  /// Sets an integer value in SharedPreferences.
  static Future<void> setInt(int data, String key) async {
    await sharedPreferences?.setInt(key, data);
  }

  /// Sets a boolean value in SharedPreferences.
  static Future<void> setBool(bool data, String key) async {
    await sharedPreferences?.setBool(key, data);
  }

  /// Retrieves a boolean value from SharedPreferences with the given key.
  static bool getBoolWithKey(String key) {
    return sharedPreferences?.getBool(key) ?? false;
  }

  /// Retrieves a boolean value from SharedPreferences with the given key.
  static bool getBoolWithKey2(String key) {
    return sharedPreferences?.getBool(key) ?? false;
  }

  /// Retrieves a string value from SharedPreferences with the given key.
  static String? getStringWithKey(String key) {
    return sharedPreferences?.getString(key);
  }
}
