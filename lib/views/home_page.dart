import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_management_system/models/faculty.dart';
import 'package:project_management_system/utils/all_data.dart';
import 'package:project_management_system/utils/constants.dart';
import 'package:project_management_system/utils/thems.dart';
import 'package:project_management_system/views/add_schedule_page.dart';
import 'package:project_management_system/views/dash_board.dart';
import 'package:project_management_system/views/group_list.dart';
import 'package:project_management_system/views/profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/group.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [DashBoard(), GroupList(), AddSchedule(), ProfilePage()];
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTotalGroup(Constants.prefs!.getString("fid")!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f6fb),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        margin: EdgeInsets.all(20),
        currentIndex: index,
        onTap: (i) => setState(() {
          print("** index: ${i}");
          index = i;
        }),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: MyAppTheme.secondaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.group),
            title: Text("Group"),
            selectedColor: MyAppTheme.secondaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.calendar_month),
            title: Text("Schedule"),
            selectedColor: MyAppTheme.secondaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: MyAppTheme.secondaryColor,
          ),
        ],
      ),
      body: pages[index],
    );
  }

  Future<void> getTotalGroup(String facultyId) async {
    var body = {"fid": "$facultyId"};
    print("** group data loaded: ${ApiData.totalGroupLoaded}");

    var res = await http.post(
        Uri.parse(
            "https://project-pilot.000webhostapp.com/API/group_count.php"),
        body: body);

    var resStudent = await http.post(
        Uri.parse(
            "https://project-pilot.000webhostapp.com/API/total_students.php"),
        body: {"fid": "$facultyId"});

    Map totalGroup = jsonDecode(res.body);
    Map totalStudents = jsonDecode(resStudent.body);
    Constants.prefs?.setString("total_groups", "${totalGroup['count']}");
    Constants.prefs?.setString("total_students", "${totalStudents['gcount']}");

    var resGroupData = await http.post(
        Uri.parse(
            "https://project-pilot.000webhostapp.com/API/group_progress_detail.php"),
        body: {"fid": "$facultyId"});

    // Parse the JSON response into a List<Map<String, dynamic>>
    if (resGroupData.body.isNotEmpty) {
      List<Map<String, dynamic>> responseData =
          List<Map<String, dynamic>>.from(jsonDecode(resGroupData.body));
    }
    print("groups: ${resGroupData.body}");
    print("groups: ${resGroupData.body.isEmpty}");

    // Faculty Data
    var resFacultyData = await http.post(
        Uri.parse(
            "https://project-pilot.000webhostapp.com/API/view_faculty.php"),
        body: {"fid": "$facultyId"});
    Map facultyData = jsonDecode(resFacultyData.body);
    print("** faculty Data: ${facultyData}");

    var checkGroupProgress = await http.get(
        Uri.parse(
            "https://project-pilot.000webhostapp.com/API/check_progress_data.php"));

    var resGroupProgressData = await http.post(
        Uri.parse(
            "https://project-pilot.000webhostapp.com/API/group_progress_detail.php"),
        body: {"fid": "$facultyId"});

    List groupJsonData = json.decode(resGroupProgressData.body);
    print("*** group data: ${groupJsonData[0]}");

    setState(() {
      ApiData.totalGroups = totalGroup['count'];
      ApiData.totalStudents = totalStudents['gcount'];
      ApiData.groupDataList = groupJsonData.map((json) => GroupData.fromJson(json)).toList();
      print("group data: ${ApiData.groupDataList}");
      ApiData.totalGroupLoaded = true;
    });
  }
}
