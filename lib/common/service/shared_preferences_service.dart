import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService<T> {
  late SharedPreferences _sharedPreferences;

  SharedPreferencesService({SharedPreferences? shared}) {
    _initSharedPreferences(shared);
  }

  Future<void> _initSharedPreferences(SharedPreferences? shared) async {
    _sharedPreferences = shared ?? await SharedPreferences.getInstance();
  }

  Future get(String key) async {
    return _sharedPreferences.get(key);
  }

  Future<List> getList() async {
    var listObjects = _sharedPreferences.getKeys();
    var listJson = [];

    for (var objectName in listObjects) {
      listJson.add(jsonDecode(_sharedPreferences.getString(objectName)!));
    }

    return listJson;
  }

  Future post(String key, T object) async {
    _sharedPreferences.setString(key, object.toString());
  }

  Future put(String key, T object) async {
    _sharedPreferences.setString(key, object.toString());
  }

  Future patch(String key, T object) async {
    _sharedPreferences.setString(key, object.toString());
  }

  Future delete(String key) async {
    _sharedPreferences.remove(key);
  }
}
