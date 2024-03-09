import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_management_system/utils/constants.dart';
import 'package:project_management_system/views/Login.dart';

import '../utils/all_data.dart';
import '../utils/thems.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 65,
                backgroundImage: AssetImage("assets/images/men.jpg"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${ApiData.facultyData!.fName}",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
              ),
              Text("${ApiData.facultyData!.fEmail}"),
              const SizedBox(height: 15),
              Container(
                child: Column(
                  children: [
                    // Mobile number
                    Card(
                      margin: const EdgeInsets.only(
                          left: 35, right: 35, bottom: 10),
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.black54,
                        ),
                        title: Text(
                          '+91 ${ApiData.facultyData!.fPhno}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // description
                    Card(
                      color: Colors.white70,
                      margin: const EdgeInsets.only(
                          left: 35, right: 35, bottom: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                        leading: Icon(
                          Icons.description,
                          color: Colors.black54,
                        ),
                        title: Text(
                          '${ApiData.facultyData!.fDesc}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Qualification
                    Card(
                      color: Colors.white70,
                      margin: const EdgeInsets.only(
                          left: 35, right: 35, bottom: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                        leading: Icon(Icons.book, color: Colors.black54),
                        title: Text(
                          '${ApiData.facultyData!.fQualif}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // Address
                    Card(
                      color: Colors.white70,
                      margin: const EdgeInsets.only(
                          left: 35, right: 35, bottom: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                        leading: Icon(
                          Icons.house,
                          color: Colors.black54,
                        ),
                        title: Text(
                          '${ApiData.facultyData!.fAddress}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // Experience
                    Card(
                      color: Colors.white70,
                      margin: const EdgeInsets.only(
                          left: 35, right: 35, bottom: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                        leading: Icon(
                          Icons.calendar_month,
                          color: Colors.black54,
                        ),
                        title: Text(
                          'Experience: ${ApiData.facultyData!.fExp}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // Log out
                    GestureDetector(
                      onTap: () {
                        Constants.prefs!.setBool("isLogin", false);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: MyAppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.only(
                            left: 35, right: 35, bottom: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Edit
              // Container(
              //   height: 70,
              //   width: 300,
              //   alignment: Alignment.center,
              //   margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
              //   decoration: BoxDecoration(
              //     color: Colors.lightBlueAccent,
              //     borderRadius: BorderRadius.circular(30),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(
              //         Icons.edit,
              //         color: Colors.white,
              //       ),
              //       const SizedBox(width: 10),
              //       Text(
              //         'Edit',
              //         style: TextStyle(
              //           fontSize: 18,
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
