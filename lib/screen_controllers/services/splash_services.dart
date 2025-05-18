import 'package:flutter/material.dart';
import 'package:videotube/model/user_model.dart';
import 'package:videotube/screen_controllers/services/user_session_controller.dart';

import 'package:videotube/screens/home_screen.dart';
import 'package:videotube/screens/login_screen.dart';
import 'package:videotube/utils/routes/route_names.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserSessionController().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((v) async {
      final value = v.data!.user;
      debugPrint(value!.email.toString());
      if (value.email.toString() == "null" || value.email == '') {
        await Future.delayed(Duration(seconds: 4));
        UserSessionController().saveUser(v);
        Navigator.pushNamed(context, RouteNames.login);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        await Future.delayed(Duration(seconds: 4));

      
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }).onError(
      (error, stackTrace) {
        debugPrint(error.toString());
      },
    );
  }
}
