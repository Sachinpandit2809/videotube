import 'package:flutter/material.dart';
import 'package:videotube/model/user_model.dart';
import 'package:videotube/repository/auth_repository.dart';

class AuthController with ChangeNotifier {
  bool _isObscure = true;

  bool get isObscure => _isObscure;

  void setObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  bool _isLoginLoading = false;

  bool get isLoginLoading => _isLoginLoading;

  void setLogin() {
    _isLoginLoading = !_isLoginLoading;
    notifyListeners();
  }

  void login(dynamic data) async {
    setLogin();
    dynamic res = await AuthRepository().login(data);
    final user = UserModel.fromJson(res);
    debugPrint(user.data?.user.toString());
    debugPrint(user.data?.accesToken.toString());
    debugPrint(user.data?.refreshToken.toString());

    setLogin();
    // notifyListeners();
  }
}
