import 'package:videotube/utils/routes/route_names.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    //   case RouteNames.login:
    //     return MaterialPageRoute(builder: (_) => const LoginScreen());

    //   case RouteNames.home:
    //     return MaterialPageRoute(builder: (_) => const HomeScreen());
    //  case RouteNames.signup:
    //     return MaterialPageRoute(builder: (_) => const SignupScreen());
    //   case RouteNames.splash:
    //     return MaterialPageRoute(builder: (_) => const SplashScreen());
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
