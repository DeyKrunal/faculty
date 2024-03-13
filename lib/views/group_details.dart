import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_management_system/utils/all_data.dart';
import 'package:project_management_system/utils/thems.dart';
import 'package:http/http.dart' as http;

class GroupDetails extends StatefulWidget {
  int index;

  GroupDetails({super.key, required this.index});

  @override
  State<GroupDetails> createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  String totalAttendance = "0";
  var x;

  @override
  void initState() {
    super.initState();
    getAttendance(ApiData.groupDataList[widget.index].grpid);
    x = ApiData.groupDataList[widget.index].gsid;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isLargeScreen = screenSize.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text("Group Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isLargeScreen ? 20.0 : 10.0),
          child: Column(
            children: [
              if (ApiData.groupDataList[widget.index].name1 != "")
                StudentDetails(
                  name: ApiData.groupDataList[widget.index].name1,
                  email: ApiData.groupDataList[widget.index].email1,
                  div: ApiData.groupDataList[widget.index].div1,
                  mobileNo: ApiData.groupDataList[widget.index].phno1,
                  rollNo: ApiData.groupDataList[widget.index].rn1,
                  isLargeScreen: isLargeScreen,
                ),
              if (ApiData.groupDataList[widget.index].name2 != "")
                StudentDetails(
                  margin: isLargeScreen ? 30 : 10,
                  name: ApiData.groupDataList[widget.index].name2,
                  email: ApiData.groupDataList[widget.index].email2,
                  div: ApiData.groupDataList[widget.index].div2,
                  mobileNo: ApiData.groupDataList[widget.index].phno2,
                  rollNo: ApiData.groupDataList[widget.index].rn2,
                  isLargeScreen: isLargeScreen,
                ),
              if (ApiData.groupDataList[widget.index].name3 != "")
                StudentDetails(
                  margin: isLargeScreen ? 30 : 10,
                  name: ApiData.groupDataList[widget.index].name3,
                  email: ApiData.groupDataList[widget.index].email3,
                  div: ApiData.groupDataList[widget.index].div3,
                  mobileNo: ApiData.groupDataList[widget.index].phno3,
                  rollNo: ApiData.groupDataList[widget.index].rn3,
                  isLargeScreen: isLargeScreen,
                ),
              if (ApiData.groupDataList[widget.index].name4 != "")
                StudentDetails(
                  margin: isLargeScreen ? 30 : 10,
                  name: ApiData.groupDataList[widget.index].name4,
                  email: ApiData.groupDataList[widget.index].email4,
                  div: ApiData.groupDataList[widget.index].div4,
                  mobileNo: ApiData.groupDataList[widget.index].phno4,
                  rollNo: ApiData.groupDataList[widget.index].rn4,
                  isLargeScreen: isLargeScreen,
                ),
              SizedBox(height: isLargeScreen ? 30 : 10),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(isLargeScreen ? 30 : 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(isLargeScreen ? 30 : 15),
                  boxShadow: [
                    BoxShadow(
                      color: MyAppTheme.primaryColor,
                      offset: Offset(10, 10),
                    ),
                  ],
                  border: Border(
                    left: BorderSide(color: MyAppTheme.primaryColorLight),
                    top: BorderSide(color: MyAppTheme.primaryColorLight),
                  ),
                ),
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Group Total Attendance: $totalAttendance"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _addAttendance();
                          },
                          child: Container(
                            width: isLargeScreen ? 300 : double.maxFinite,
                            decoration: BoxDecoration(
                              color: MyAppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(isLargeScreen ? 20 : 15),
                            alignment: Alignment.center,
                            child: Text(
                              'Add Attendance',
                              style: TextStyle(
                                fontSize: isLargeScreen ? 18 : 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: isLargeScreen ? 30 : 10),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getAttendance(String gid) async {
    var res = await http.post(
      Uri.parse("https://project-pilot.000webhostapp.com/API/view_attendance.php"),
      body: {"gid": "$gid"},
    );

    print("group progress: ${res.body}");
    totalAttendance = jsonDecode(res.body)["count"];
    setState(() {});
  }

  Future<void> _addAttendance() async {
    print("X = ${x}");
    var res = await http.post(
      Uri.parse("https://project-pilot.000webhostapp.com/API/insert_attendance.php"),
      body: {"gid": "$x"},
    );
    print("group attendance: ${res.body}");
    getAttendance(x);
    setState(() {});
  }
}

class StudentDetails extends StatelessWidget {
  final String name;
  final String email;
  final String div;
  final String rollNo;
  final String mobileNo;
  final double margin;
  final bool isLargeScreen;

  const StudentDetails({
    Key? key,
    required this.name,
    required this.email,
    required this.div,
    required this.mobileNo,
    required this.rollNo,
    this.margin = 0,
    required this.isLargeScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(top: margin),
      padding: EdgeInsets.all(isLargeScreen ? 30 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isLargeScreen ? 30 : 15),
        boxShadow: [
          BoxShadow(
            color: MyAppTheme.primaryColor,
            offset: Offset(10, 10),
          ),
        ],
        border: Border(
          left: BorderSide(color: MyAppTheme.primaryColorLight),
          top: BorderSide(color: MyAppTheme.primaryColorLight),
        ),
      ),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: isLargeScreen ? 18 : 16,
                  fontWeight: FontWeight.bold,
                  color: MyAppTheme.primaryColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                email,
                style: TextStyle(
                  fontSize: isLargeScreen ? 16 : 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: isLargeScreen ? 8 : 5),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: isLargeScreen ? 20 : 10),
                height: isLargeScreen ? 100 : 70,
                width: isLargeScreen ? 100 : 70,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Div  ",
                        style: TextStyle(
                          fontSize: isLargeScreen ? 18 : 16,
                          fontWeight: FontWeight.w700,
                          color: MyAppTheme.primaryColor,
                        ),
                      ),
                      Text(
                        div,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Roll No  ",
                        style: TextStyle(
                          fontSize: isLargeScreen ? 18 : 16,
                          fontWeight: FontWeight.w700,
                          color: MyAppTheme.primaryColor,
                        ),
                      ),
                      Text(rollNo),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: MyAppTheme.primaryColor,
                      ),
                      SizedBox(width: isLargeScreen ? 8 : 5),
                      Text("+91: $mobileNo"),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
