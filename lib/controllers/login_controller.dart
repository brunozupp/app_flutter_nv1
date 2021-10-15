import 'package:flutter/widgets.dart';
import 'package:repos_pattern_flutter/services/prefs_service.dart';

class LoginController {

  final inLoader = ValueNotifier<bool>(false);
 
  String? _login;
  void setLogin(String value) => _login = value;

  String? _password;
  void setPassword(String value) => _password = value;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(const Duration(seconds: 2));
    inLoader.value = false;

    var response =  _login == "admin" && _password == "123";

    if(response) {
      await PrefsService.save(_login!);
    }

    return response;
  }
}