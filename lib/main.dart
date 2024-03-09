import 'package:flutter/material.dart';
import 'package:project_management_system/views/Login.dart';
import 'package:project_management_system/views/check_login.dart';
import 'package:project_management_system/views/home_page.dart';
import 'package:project_management_system/views/splash.dart';
// import 'package:project_management_system/views/login%20page/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckLogin(),
    ),
  );
}
