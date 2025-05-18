import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videotube/resource/components/ext/num_ext.dart';
import 'package:videotube/resource/components/round_button.dart';
import 'package:videotube/resource/k_text_style.dart';
import 'package:videotube/screen_controllers/auth_controller.dart';
import 'package:videotube/utils/routes/route_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Consumer<AuthController>(builder: (context, authController, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "WElCOME BACK!",
                  style: KTextStyle.K_34,
                ),
                40.heightBox,
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                20.heightBox,
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                20.heightBox,
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                20.heightBox,
                RoundButton(
                    title: "Login",
                    loading: authController.isLoginLoading,
                    onPress: () {
                      var data = {
                        "username": usernameController.text,
                        "email": emailController.text,
                        "password": passwordController.text
                      };
                      authController.login(data, context);
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.signup);
                        },
                        child: Text("Sign Up"))
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
