import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  // Initialize the SharedPreferences instance
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save String
  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // Retrieve String
  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  // Save int
  static Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  // Retrieve int
  static int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  // Save bool
  static Future<void> setBool(String key, bool value) async {
    print("__________$value");
    await _prefs?.setBool(key, value);
  }

  // Retrieve bool
  static bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  // Save double
  static Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  // Retrieve double
  static double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  // Save List<String>
  static Future<void> setStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
  }

  // Retrieve List<String>
  static List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  // Remove a specific key
  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  // Clear all preferences
  static Future<void> clear() async {
    await _prefs?.clear();
  }

  // Check if key exists
  static bool containsKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }
}
