import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService<T> {
  late SharedPreferences _sharedPreferences;

  SharedPreferencesService() : super() {
    SharedPreferences.getInstance().then((value) => _sharedPreferences = value);
  }

  Future<Response> get(String key, {bool isList = false}) async {
    try {
      final content = (isList ? await getList() : _sharedPreferences.get(key));
      return Response(content, 200);
    } catch (error) {
      // erro de não encontrado
      return Response(error.toString(), 404);
    }
  }

  Future getList() async {
    var listObjects = _sharedPreferences.getKeys();
    var listJson = [];

    for (var objectName in listObjects) {
      listJson.add(jsonDecode(_sharedPreferences.getString(objectName)!));
    }

    return jsonEncode(listJson);
  }

  // post definido apenas para
  Future<Response> post(String key, T object) async {
    _sharedPreferences.setString(key, object.toString());
    return Response('', 204);
  }

  Future<Response> put(String key, object) async {
    _sharedPreferences.setString(key, object.toString());
    return Response('', 204);
  }

  Future<Response> patch(String key, Map<String, dynamic> partialUpdate) async {
    var currentValue = _sharedPreferences.getString(key);
    if (currentValue != null) {
      var currentJson = jsonDecode(currentValue);
      currentJson.addAll(partialUpdate);
      _sharedPreferences.setString(key, jsonEncode(currentJson));
    }
    return Response('', 204);
  }

  Future<Response> delete(String key) async {
    _sharedPreferences.remove(key);
    return Response('', 204);
  }
}
