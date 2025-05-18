import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:videotube/model/user_model.dart';
import 'package:videotube/resource/components/ext/num_ext.dart';
import 'package:videotube/resource/components/round_button.dart';
import 'package:videotube/screen_controllers/auth_controller.dart';
import 'package:videotube/utils/routes/route_names.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? _avatar;
  File? _coverImage;
  final picker = ImagePicker();
  bool loading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _pickImage(bool isAvatar) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isAvatar) {
          _avatar = File(pickedFile.path);
        } else {
          _coverImage = File(pickedFile.path);
        }
      });
    }
  }

  Future<void> _uploadData(
      Map<String, dynamic> data, BuildContext context) async {
    setState(() {
      loading = true;
    });
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.151.32:3000/api/v1/users/register'),
    );

    // request.fields['username'] = 'demo5';
    // request.fields['fullname'] = 'demo5 kumar';
    // request.fields['email'] = 'demo5@gmail.com';
    // request.fields['password'] = '12345678';

    request.fields['fullname'] = data['fullname'];
    request.fields['username'] = data['username'];
    request.fields['email'] = data['email'];
    request.fields['password'] = data['password'];

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

    if (response.statusCode == 200 || response.statusCode == 201) {
      String responseBody = await response.stream.bytesToString();
      dynamic res = jsonDecode(responseBody);
      debugPrint("Upload successful: ${res.toString()}");
      UserModel.fromJson(res);
      UserModel user = UserModel();
      debugPrint(user.message.toString());
      debugPrint(user.data?.user.toString());
      debugPrint(user.data?.accesToken.toString());
      debugPrint(user.data?.refreshToken.toString());
    } else {
      debugPrint("Upload failed with status: ${response.statusCode}");
    }
    setState(() {
      loading = false;
    });
    Navigator.pushNamed(context, RouteNames.login);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register"),
      ),
      body: Consumer<AuthController>(builder: (context, authController, _) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    

                    Positioned(
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          // color: Colors.amber,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: _coverImage != null
                                ? FileImage(_coverImage!.absolute)
                                : NetworkImage(
                                    "https://img.freepik.com/free-photo/abstract-luxury-gradient-blue-background-smooth-dark-blue-with-black-vignette-studio-banner_1258-100595.jpg?semt=ais_hybrid&w=740"),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 15,
                          child: InkWell(
                              onTap: () {
                                _pickImage(false);
                              },
                              child: Icon(Icons.edit)),
                        )),
                    // circular avatar
                    Positioned(
                      bottom: 0,
                      right: 130,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _avatar != null
                            ? FileImage(_avatar!.absolute)
                            : NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkF17GkzaTA0PzQjgSusQHlkBbFiA7_vswEA&ss"),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 120,
                        child: CircleAvatar(
                          radius: 15,
                          child: InkWell(
                              onTap: () {
                                _pickImage(true);
                              },
                              child: Icon(Icons.add)),
                        )),
                  ],
                ),
                20.heightBox,
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(hintText: "username"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'username is required';
                    }
                    return null;
                  },
                ),
                20.heightBox,
                TextFormField(
                    controller: fullnameController,
                    decoration: InputDecoration(hintText: "fullname"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'fullname is required';
                      }
                      return null;
                    }),
                20.heightBox,
                TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: "email"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email is required';
                      }
                      return null;
                    }),
                20.heightBox,
                TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(hintText: "password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password is required';
                      }
                      return null;
                    }),
               
                RoundButton(
                    title: "Resister",
                    loading: loading,
                    onPress: () {
                      Map<String, dynamic> data = {
                        "username": usernameController.text,
                        "fullname": fullnameController.text,
                        "email": emailController.text,
                        "password": passwordController.text
                      };
                      if (_formKey.currentState!.validate()) {
                        _uploadData(data, context);
                      }
                    })

                // ElevatedButton(
                //   onPressed: () {
                //     logout();
                //   },
                //   child: Text("Log-out"),
                // ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
