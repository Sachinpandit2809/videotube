import 'package:videotube/screens/login_screen.dart';
import 'package:videotube/screens/register_screen.dart';
import 'package:videotube/utils/routes/route_names.dart';
import 'package:flutter/material.dart';

import '../../screen_controllers/services/splash_screen.dart';
import '../../screens/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
     case RouteNames.signup:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Routes Define"),
            ),
          );
        });
    }
  }
}
