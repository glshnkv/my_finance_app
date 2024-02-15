import 'package:shared_preferences/shared_preferences.dart';

const String _kuserNameKey = 'userName';
const String _kuserEmailKey = 'userEmail';
const String _kincomeKey = 'income';
const String _kspendKey = 'spend';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  dynamic _getData(String key) {
    var value = _preferences.get(key);

    print('Retrieved $key: $value');

    return value;
  }

  void _saveData(String key, dynamic value) {
    print('Saving $key: $value');

    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }

  String get userName => _getData(_kuserNameKey) ?? 'User User';
  set userName(String value) => _saveData(_kuserNameKey, value);

  String get userEmail => _getData(_kuserEmailKey) ?? 'user@user.com';
  set userEmail(String value) => _saveData(_kuserEmailKey, value);

  double get income => _getData(_kincomeKey) ?? 0;
  set income(double value) => _saveData(_kincomeKey, value);

  double get spend => _getData(_kspendKey) ?? 0;
  set spend(double value) => _saveData(_kspendKey, value);
}