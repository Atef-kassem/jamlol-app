import 'dart:convert';

import 'package:obour/core/cache/shared_preferences.dart';
import 'package:obour/features/auth/sign_up/data/models/sign_up_model.dart';


class UserManager {
  static final UserManager _instance = UserManager._internal();
  factory UserManager() => _instance;
  UserManager._internal();

  SignUpUserModel? _user;

  Future<void> saveUser(SignUpUserModel user) async {
    _user = user;
    await CacheData.saveData(
      key: "signUpUser",
      data: jsonEncode(user.toJson()),
    );
  }


  SignUpUserModel? get user {
    if (_user != null) return _user;
    final raw = CacheData.getData(key: "signUpUser");
    if (raw != null) {
      _user =  SignUpUserModel.fromJson(jsonDecode(raw));
    }
    return _user;
  }


  Future<void> clearUser() async {
    _user = null;
    await CacheData.removeData("signUpUser");
  }
}