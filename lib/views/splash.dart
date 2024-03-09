import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_management_system/views/home_page.dart';
import 'package:rive/rive.dart';
import 'Login.dart';

void main() {
  runApp(splash());
}

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // This sets the splash screen as the home screen
      // Set other configurations for your app here
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool isShowSignInDialog = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Define animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    // Define animation
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start animation
    _controller.forward();

    // After animation completes, navigate to the next screen
    Timer(Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => OnbodingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery
                .of(context)
                .size
                .width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/Backgrounds/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child:
                      SizedBox(
                          width: 700,
                          height: 480,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                            child: FadeTransition(
                              opacity: _animation,
                              child: Center(
                                child: Image.asset(
                                  'assets/logo.jpg', // Replace 'logo.png' with your image file
                                  width: 500,
                                  height: 500,
                                ),
                              ),
                            ),
                          )
                      ),
                    ),
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
    _controller.dispose();
    super.dispose();
  }
}
class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  late RiveAnimationController _btnAnimationController;

  bool isShowSignInDialog = false;

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
            bottom: 100,
            child: Image.asset(
              "assets/Backgrounds/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
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
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(25,100,20,0),
                      child: Text(
                        'Progress \nPilot',
                        style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),

                    SizedBox(
                      width: 225,
                      height: 140,
                      child: Padding(padding: EdgeInsets.fromLTRB(5,20, 0, 60),
                        child: FloatingActionButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  LoginPage()),
                            );
                          }, child: Text(" Sign In ",style: TextStyle(fontSize: 20,color: Colors.black)),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 225,
                      height: 140,
                      child: Padding(padding: EdgeInsets.fromLTRB(5,5, 0, 70),
                        child: FloatingActionButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  HomePage()),
                            );
                          }, child: Text("Fill Group details",style: TextStyle(fontSize: 20,color: Colors.black)),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}