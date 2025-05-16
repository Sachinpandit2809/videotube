import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videotube/screen_controllers/auth_controller.dart';
import 'package:videotube/screens/home_screen.dart';
import 'package:videotube/screens/login_screen.dart';

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
      ],
      child: MaterialApp(
          title: 'videotube',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoginScreen()),
    );
  }
}
