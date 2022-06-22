import 'package:flutter/material.dart';
import 'package:myshoe/models/users_model.dart';
import 'package:myshoe/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
    String name,
    String username,
    String email,
    String password,
  ) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> login(
    String email,
    String password,
  ) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
