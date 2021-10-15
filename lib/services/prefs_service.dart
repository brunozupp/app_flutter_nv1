import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {

  static const String _key = "key";

  static save(String user) async {

    var instance = await SharedPreferences.getInstance();

    instance.setString(
      _key, 
      jsonEncode({
        "user": user,
        "isAuth": true
      })
    );
  }

  static Future<bool> isAuth() async {

    var instance = await SharedPreferences.getInstance();

    if(!instance.containsKey(_key)) return false;

    var response = jsonDecode(instance.getString(_key)!);

    return response["isAuth"];
  }

  static logout() async {
    var instance = await SharedPreferences.getInstance();
    await instance.remove(_key);
  }
}