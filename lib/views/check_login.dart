import 'package:flutter/material.dart';
import 'package:project_management_system/utils/constants.dart';
import 'package:project_management_system/views/Login.dart';
import 'package:project_management_system/views/home_page.dart';

class CheckLogin extends StatefulWidget {
  const CheckLogin({super.key});

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  @override
  void initState() {
    // TODO: implement initState
    Constants.getPrefrence();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      bool? s = Constants.prefs?.getBool("isLogin");
      print(
          "** check login s: ${Constants.prefs?.getBool("isLogin") ?? false}");
      if (s ?? false) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      }
    });
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
