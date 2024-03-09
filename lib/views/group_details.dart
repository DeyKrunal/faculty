import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
  String totalAttendence = "0";
  var x ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAttendence(ApiData.groupDataList[widget.index].grpid);
    x = ApiData.groupDataList[widget.index].gsid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfff5f6fb),
      appBar: AppBar(
        title: Text("Group Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ApiData.groupDataList[widget.index].name1 == ""
                  ? Container()
                  : StudentDetails(
                      name: ApiData.groupDataList[widget.index].name1,
                      email: ApiData.groupDataList[widget.index].email1,
                      div: ApiData.groupDataList[widget.index].div1,
                      mobileNo: ApiData.groupDataList[widget.index].phno1,
                      rollNo: ApiData.groupDataList[widget.index].rn1,
                    ),
              ApiData.groupDataList[widget.index].name2 == ""
                  ? Container()
                  : StudentDetails(
                      margin: 30,
                      name: ApiData.groupDataList[widget.index].name2,
                      email: ApiData.groupDataList[widget.index].email2,
                      div: ApiData.groupDataList[widget.index].div2,
                      mobileNo: ApiData.groupDataList[widget.index].phno2,
                      rollNo: ApiData.groupDataList[widget.index].rn2,
                    ),
              ApiData.groupDataList[widget.index].name3 == ""
                  ? Container()
                  : StudentDetails(
                      margin: 30,
                      name: ApiData.groupDataList[widget.index].name3,
                      email: ApiData.groupDataList[widget.index].email3,
                      div: ApiData.groupDataList[widget.index].div3,
                      mobileNo: ApiData.groupDataList[widget.index].phno3,
                      rollNo: ApiData.groupDataList[widget.index].rn3,
                    ),
              ApiData.groupDataList[widget.index].name4 == ""
                  ? Container()
                  : StudentDetails(
                      margin: 30,
                      name: ApiData.groupDataList[widget.index].name4,
                      email: ApiData.groupDataList[widget.index].email4,
                      div: ApiData.groupDataList[widget.index].div4,
                      mobileNo: ApiData.groupDataList[widget.index].phno4,
                      rollNo: ApiData.groupDataList[widget.index].rn4,
                    ),
              const SizedBox(height: 30),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: MyAppTheme.primaryColor,
                      offset: Offset(10, 10),
                    )
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
                    Text("Group Total Attendance: $totalAttendence"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap:(){
                            _addAttendance();
                        },
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: MyAppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            child: Text(
                              'Add Attendance',
                              style: TextStyle(
                                fontSize: 18,
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
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getAttendence(String gid) async {
    var res = await http.post(
        Uri.parse(
            "https://project-pilot.000webhostapp.com/API/view_attandence.php"),
        body: {"gid": "$gid"});

    print("group progress: ${res.body}");
    totalAttendence = jsonDecode(res.body)["count"];
    setState(() {});
  }

  Future<void> _addAttendance() async {
    print("X = ${x}");
    var res = await http.post(
        Uri.parse(
            "https://project-pilot.000webhostapp.com/API/insert_attendance.php"),
        body: {"gid": "$x"});
    print("group attendance: ${res.body}");
    getAttendence(x);
    setState(() {});
  }

}

class StudentDetails extends StatelessWidget {
  String name;
  String email;
  String div;
  String rollNo;
  String mobileNo;
  double margin;

  StudentDetails({
    super.key,
    required this.name,
    required this.email,
    required this.div,
    required this.mobileNo,
    required this.rollNo,
    this.margin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(top: margin),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: MyAppTheme.primaryColor,
            offset: Offset(10, 10),
          )
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
                  fontSize: 18,
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
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                height: 100,
                width: 100,
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
                          fontSize: 18,
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
                          fontSize: 18,
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
                      const SizedBox(width: 8),
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
