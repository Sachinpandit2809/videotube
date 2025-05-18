import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videotube/screen_controllers/auth_controller.dart';
import 'package:videotube/screen_controllers/services/user_session_controller.dart';
import 'package:videotube/screens/register_screen.dart';

import 'utils/routes/route_names.dart';
import 'utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => UserSessionController()),
      ],
      child: MaterialApp(
          title: 'videotube',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: RouteNames.splash,
          onGenerateRoute: Routes.generateRoute,
          home: RegisterScreen()),
    );
  }
}
