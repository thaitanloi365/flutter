import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPrefs {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static SharedPreferences _prefsInstance;

  static bool _initCalled = false;

  static Future<SharedPreferences> init() async {
    _initCalled = true;
    _prefsInstance = await _prefs;
    return _prefsInstance;
  }

  static void dispose() {
    _prefs = null;
    _prefsInstance = null;
  }

  static Set<String> getKeys() {
    assert(_initCalled,
        "SharedPrefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call SharedPrefs.getKeysF() instead. SharedPreferences not ready yet!");
    return _prefsInstance.getKeys();
  }

  /// Returns a Future.
  static Future<Set<String>> getKeysF() async {
    Set<String> value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.getKeys() ?? Set();
    } else {
      value = getKeys();
    }
    return value;
  }

  /// Reads a value of any type from persistent storage.
  static dynamic get(String key) {
    assert(_initCalled,
        "SharedPrefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call SharedPrefs.getF(key) instead. SharedPreferences not ready yet!");
    return _prefsInstance.get(key);
  }

  /// Returns a Future.
  static Future<dynamic> getF(String key) async {
    dynamic value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.get(key);
    } else {
      value = get(key);
    }
    return value;
  }

  static bool getBool(String key, [bool defValue]) {
    assert(_initCalled,
        "SharedPrefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call SharedPrefs.getBoolF(key) instead. SharedPreferences not ready yet!");
    return _prefsInstance.getBool(key) ?? defValue ?? false;
  }

  /// Returns a Future.
  static Future<bool> getBoolF(String key, [bool defValue]) async {
    bool value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.getBool(key) ?? defValue ?? false;
    } else {
      value = getBool(key);
    }
    return value;
  }

  static int getInt(String key, [int defValue]) {
    assert(_initCalled,
        "SharedPrefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call SharedPrefs.getIntF(key) instead. SharedPreferences not ready yet!");
    return _prefsInstance.getInt(key) ?? defValue ?? 0;
  }

  /// Returns a Future.
  static Future<int> getIntF(String key, [int defValue]) async {
    int value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.getInt(key) ?? defValue ?? 0;
    } else {
      value = getInt(key);
    }
    return value;
  }

  static double getDouble(String key, [double defValue]) {
    assert(_initCalled,
        "SharedPrefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call SharedPrefs.getDoubleF(key) instead. SharedPreferences not ready yet!");
    return _prefsInstance.getDouble(key) ?? defValue ?? 0.0;
  }

  /// Returns a Future.
  static Future<double> getDoubleF(String key, [double defValue]) async {
    double value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.getDouble(key) ?? defValue ?? 0.0;
    } else {
      value = getDouble(key);
    }
    return value;
  }

  static String getString(String key, [String defValue]) {
    assert(_initCalled,
        "SharedPrefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call SharedPrefs.getStringF(key)instead. SharedPreferences not ready yet!");
    return _prefsInstance.getString(key) ?? defValue ?? "";
  }

  /// Returns a Future.
  static Future<String> getStringF(String key, [String defValue]) async {
    String value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.getString(key) ?? defValue ?? "";
    } else {
      value = getString(key);
    }
    return value;
  }

  static List<String> getStringList(String key, [List<String> defValue]) {
    assert(_initCalled,
        "SharedPrefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call SharedPrefs.getStringListF(key) instead. SharedPreferences not ready yet!");
    return _prefsInstance.getStringList(key) ?? defValue ?? [""];
  }

  static Future<List<String>> getStringListF(String key,
      [List<String> defValue]) async {
    List<String> value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.getStringList(key) ?? defValue ?? [""];
    } else {
      value = getStringList(key);
    }
    return value;
  }

  static Future<Map> getMap(String key, [Map defValue]) async {
    Map value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      final string = instance?.getString(key) ?? defValue ?? "";
      value = json.decode(string);
    } else {
      final string = getString(key);
      value = json.decode(string);
    }
    return value;
  }

  static Future<bool> setBool(String key, bool value) async {
    var instance = await _prefs;
    return instance?.setBool(key, value) ?? Future.value(false);
  }

  static Future<bool> setInt(String key, int value) async {
    var instance = await _prefs;
    return instance?.setInt(key, value) ?? Future.value(false);
  }

  static Future<bool> setDouble(String key, double value) async {
    var instance = await _prefs;
    return instance?.setDouble(key, value) ?? Future.value(false);
  }

  static Future<bool> setString(String key, String value) async {
    var instance = await _prefs;
    return instance?.setString(key, value) ?? Future.value(false);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    var instance = await _prefs;
    return instance?.setStringList(key, value) ?? Future.value(false);
  }

  static Future<bool> setMap(String key, Map<String, dynamic> map) async {
    var instance = await _prefs;
    var value = json.encode(map);
    return instance?.setString(key, value) ?? Future.value(false);
  }

  static Future<bool> remove(String key) async {
    var instance = await _prefs;
    return instance?.remove(key) ?? Future.value(false);
  }

  static Future<bool> clear() async {
    var instance = await _prefs;
    return instance?.clear() ?? Future.value(false);
  }
}
