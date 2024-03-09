import 'package:flutter/material.dart';
import 'package:project_management_system/components/text_const.dart';
import 'package:project_management_system/utils/thems.dart';
import 'package:searchfield/searchfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    List countriesList = [
      'Pakistan',
      'Afghanistan',
      'America',
      'China',
      'Indonesia'
    ];
    String itemSelected = '';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/welcome.png'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextConst(
                    text: 'WELCOME',
                    fontSize: 25,
                    color: MyAppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    letterSpacing: 1.5,
                  ),
                  TextConst(
                    text: 'Login to continue!',
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    letterSpacing: 1.5,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: MyAppTheme.primaryColor,
                ),
                alignment: Alignment.center,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 15,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.center,
                              child: SearchField(
                                suggestions: List.from(
                                  countriesList.map(
                                    (e) => SearchFieldListItem(e),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
