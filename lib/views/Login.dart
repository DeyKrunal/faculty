import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project_management_system/views/home_page.dart';
import 'package:rive/rive.dart';
import 'package:project_management_system/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  // final call_api api = call_api();
  late RiveAnimationController _btnAnimationController;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isShowSignInDialog = false;
  bool _wrongPass = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100, child: Container(),
            // child: Image.asset(
            //   "assets/Backgrounds/Spline.png",
            // ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          // const RiveAnimation.asset(
          //   "assets/RiveAssets/shapes.riv",
          // ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(130, 100, 20, 10),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                      ),
                    ),

                    // Center(
                    //   child:
                    SizedBox(
                      width: 700,
                      height: 500,
                      // child: Padding(
                      //   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      //   child: Card(
                      //     color: Colors.white60,
                      //     margin: EdgeInsets.all(20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 30, 5, 5),
                                child: TextFormField(
                                  controller: _nameController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.group,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    labelText: "Faculty Name",
                                    hintText: "Enter Name",
                                  ),
                                  validator: (msg) {
                                    if (msg!.isEmpty) {
                                      return "Name is Required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
                                child: TextFormField(
                                  controller: _passwordController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock,
                                        color: Colors.black),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    labelText: "Password",
                                    hintText: "Enter Password",
                                  ),
                                  validator: (msg) {
                                    if (msg!.isEmpty) {
                                      return "password is Required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              _wrongPass
                                  ? const Text(
                                      "Wrong Password",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : Container(),
                              // Padding(
                              //   padding: EdgeInsets.fromLTRB(150, 0, 0, 20),
                              //   child: TextButton(
                              //     onPressed: () {},
                              //     child: Text('Forgot Password?',
                              //         style: TextStyle(
                              //             color: Colors.black, fontSize: 15)),
                              //   ),
                              // ),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: FloatingActionButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      var name = _nameController.text;
                                      var pwd = _passwordController.text;
                                      await loginFaculty(name, pwd)
                                          .then((value) {
                                        print("value: ${value}");
                                        print("value: ${value.runtimeType}");
                                        if (value == "0") {
                                          setState(() {
                                            _wrongPass = true;
                                          });
                                        } else {
                                          setState(() {
                                            _wrongPass = false;
                                          });
                                          Constants.prefs!
                                              .setBool("isLogin", true);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomePage(),
                                              ));
                                          print(
                                              "** login s:${Constants.prefs?.getBool("isLogin")}");
                                        }
                                      });
                                    }
                                  },
                                  child: const Text('Login',
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ),
                    ),
                    // ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<String> loginFaculty(String fName, String fPass) async {
    var res = await http.post(
        Uri.parse("https://project-pilot.000webhostapp.com/API/login_api.php"),
        body: {"name": "$fName", "pwd": "$fPass"});
    print("res: ${res.body}");

    var finalRespoanse = jsonDecode(res.body);
    if (finalRespoanse["success"] == 1) {
      Constants.prefs!.setString("fid", finalRespoanse["fid"]);
    } else {
      Constants.prefs!.setString("fid", "");
    }
    return finalRespoanse["success"].toString();

    print("fid: ${finalRespoanse["fid"]}");
  }

// Future<void> _saveData(key,value) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('$key', '$value');
//   print('Data saved');
//     }
}
