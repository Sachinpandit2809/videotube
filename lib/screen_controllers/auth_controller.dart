import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:videotube/model/user_model.dart';
import 'package:videotube/repository/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:videotube/resource/app_url/app_url.dart';

import '../utils/utils.dart';
import 'services/user_session_controller.dart';

class AuthController with ChangeNotifier {
  bool _isObscure = true;
  bool get isObscure => _isObscure;
  void setObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  bool _isLoginLoading = false;
  bool get isLoginLoading => _isLoginLoading;
  void setLogin(bool value) {
    _isLoginLoading = value;
    notifyListeners();
  }

  void login(dynamic data, BuildContext context) async {
    setLogin(true);
    dynamic res = await AuthRepository().login(data);
    final user = UserModel.fromJson(res);
    debugPrint(res.toString());
    final userPreference =
        Provider.of<UserSessionController>(context, listen: false);
    userPreference.saveUser(user);
    Utils.toastSuccessMessage(user.message.toString());

    // debugPrint(user.data?.user!.email.toString());
    // debugPrint(user.data?.user!.avatar.toString());

    // debugPrint(user.data?.accesToken.toString());
    // debugPrint(user.data?.refreshToken.toString());

    setLogin(false);
    // notifyListeners();
  }

  File? _avatar;
  File? _coverImage;
  final picker = ImagePicker();
  void pickAvatarImage() async {
    // _avatar = await picker.pickImage(source: ImageSource.camera);
  }

  void pickCoverImage() async {
    // _coverImage = await picker.pickImage(source: ImageSource.gallery);
  }

  Future uploadData() async {
    debugPrint("SignUp triggered");
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${AppUrl.baseUrl}/users/register'),
      // Uri.parse('http://192.168.59.32:3000/api/v1/users/login'),
    );

    request.fields['username'] = 'Rohan';
    request.fields['fullname'] = 'Rohan Pandit';
    request.fields['email'] = 'Rohan@example.com';
    request.fields['password'] = '12345678';

    if (_avatar != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'avatar',
        _avatar!.path,
        filename: basename(_avatar!.path),
      ));
    }

    if (_coverImage != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'coverImage',
        _coverImage!.path,
        filename: basename(_coverImage!.path),
      ));
    }

    var response = await request.send();
    debugPrint("response come");

    if (response.statusCode == 200) {
      debugPrint("Upload successful");
    } else {
      debugPrint("Upload failed with status: ${response.statusCode}");
    }
  }
}
