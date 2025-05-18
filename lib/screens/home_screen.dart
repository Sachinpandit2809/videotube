import 'package:provider/provider.dart';
import 'package:videotube/resource/components/ext/num_ext.dart';
// import 'package:videotube/widgets/task_icon_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:videotube/resource/k_text_style.dart';
import 'package:videotube/screen_controllers/services/user_session_controller.dart';
import 'package:videotube/utils/routes/route_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Home Screen'),
          centerTitle: true,
          actions: [
            TextButton(
                onPressed: () {
                  final userPreference = Provider.of<UserSessionController>(
                      context,
                      listen: false);
                  userPreference.removeUser();
                  Navigator.popAndPushNamed(context, RouteNames.login);
                },
                child: Text(
                  "LogOut",
                  style: KTextStyle.K_14 ,
                ))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            40.heightBox,
            Text("What do you want to do today?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
