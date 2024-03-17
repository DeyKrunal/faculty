import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_management_system/models/group.dart';
import 'package:project_management_system/utils/all_data.dart';
import 'package:project_management_system/utils/thems.dart';
import 'package:http/http.dart' as http;
import 'package:project_management_system/views/dash_board.dart';
import 'package:project_management_system/views/home_page.dart';

bool updateGroupList = false;

class GroupDetails extends StatefulWidget {
  List<GroupData> groupDataList;
  int index;

  GroupDetails({super.key, required this.index, required this.groupDataList});

  @override
  State<GroupDetails> createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  String totalAttendence = "0";
  bool _isProgressUpdated = true;
  double p1 = 0;
  double p2 = 0;
  double p3 = 0;
  double p4 = 0;
  double p5 = 0;
  double p6 = 0;
  double p7 = 0;
  double p8 = 0;
  double p9 = 0;

  @override
  void initState() {
    super.initState();
    getAttendence(widget.groupDataList[widget.index].grpid);
    p1 = double.parse(widget.groupDataList[widget.index].p1);
    p2 = double.parse(widget.groupDataList[widget.index].p2);
    p3 = double.parse(widget.groupDataList[widget.index].p3);
    p4 = double.parse(widget.groupDataList[widget.index].p4);
    p5 = double.parse(widget.groupDataList[widget.index].p5);
    p6 = double.parse(widget.groupDataList[widget.index].p6);
    p7 = double.parse(widget.groupDataList[widget.index].p7);
    p8 = double.parse(widget.groupDataList[widget.index].p8);
    p9 = double.parse(widget.groupDataList[widget.index].p9);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(index: 0),));
      },
      child: Scaffold(
        // backgroundColor: Color(0xfff5f6fb),
        appBar: AppBar(
          title: const Text("Group Details"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                widget.groupDataList[widget.index].name1 == ""
                    ? Container()
                    : StudentDetails(
                        name: widget.groupDataList[widget.index].name1,
                        email: widget.groupDataList[widget.index].email1,
                        div: widget.groupDataList[widget.index].div1,
                        mobileNo: widget.groupDataList[widget.index].phno1,
                        rollNo: widget.groupDataList[widget.index].rn1,
                      ),
                widget.groupDataList[widget.index].name2 == ""
                    ? Container()
                    : StudentDetails(
                        margin: 30,
                        name: widget.groupDataList[widget.index].name2,
                        email: widget.groupDataList[widget.index].email2,
                        div: widget.groupDataList[widget.index].div2,
                        mobileNo: widget.groupDataList[widget.index].phno2,
                        rollNo: widget.groupDataList[widget.index].rn2,
                      ),
                widget.groupDataList[widget.index].name3 == ""
                    ? Container()
                    : StudentDetails(
                        margin: 30,
                        name: widget.groupDataList[widget.index].name3,
                        email: widget.groupDataList[widget.index].email3,
                        div: widget.groupDataList[widget.index].div3,
                        mobileNo: widget.groupDataList[widget.index].phno3,
                        rollNo: widget.groupDataList[widget.index].rn3,
                      ),
                widget.groupDataList[widget.index].name4 == ""
                    ? Container()
                    : StudentDetails(
                        margin: 30,
                        name: widget.groupDataList[widget.index].name4,
                        email: widget.groupDataList[widget.index].email4,
                        div: widget.groupDataList[widget.index].div4,
                        mobileNo: widget.groupDataList[widget.index].phno4,
                        rollNo: widget.groupDataList[widget.index].rn4,
                      ),
                const SizedBox(height: 30),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: MyAppTheme.primaryColor,
                        offset: const Offset(10, 10),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text("Group Total Attendance: $totalAttendence"),
                      // const SizedBox(height: 10),
                      const Text("Group Progress"),
                      const SizedBox(height: 10),
                      // p1
                      const Text("Project Profile & Objectives"),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        value: p1,
                        activeColor: MyAppTheme.primaryColor,
                        divisions: 5,
                        onChanged: (dynamic value) {
                          setState(() {
                            p1 = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20),
                      // p2
                      const Text("Requirment Specification"),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        value: p2,
                        divisions: 5,
                        activeColor: MyAppTheme.primaryColor,
                        onChanged: (dynamic value) {
                          setState(() {
                            p2 = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20),
                      // p3
                      const Text("Project Module & Flow"),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        value: p3,
                        divisions: 5,
                        activeColor: MyAppTheme.primaryColor,
                        onChanged: (dynamic value) {
                          setState(() {
                            p3 = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20),
                      // p4
                      const Text("Data Dictionary & Table Relation"),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        value: p4,
                        divisions: 5,
                        activeColor: MyAppTheme.primaryColor,
                        onChanged: (dynamic value) {
                          setState(() {
                            p4 = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20),
                      // p5
                      const Text("DFD Or UseCase Or UML Etc.."),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        value: p5,
                        divisions: 5,
                        activeColor: MyAppTheme.primaryColor,
                        onChanged: (dynamic value) {
                          setState(() {
                            p5 = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20),
                      // p6
                      const Text("Backend Or Userside"),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        value: p6,
                        divisions: 5,
                        activeColor: MyAppTheme.primaryColor,
                        onChanged: (dynamic value) {
                          setState(() {
                            p6 = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20),
                      // p7
                      const Text("Frontend or Adminside"),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        value: p7,
                        divisions: 5,
                        activeColor: MyAppTheme.primaryColor,
                        onChanged: (dynamic value) {
                          setState(() {
                            p7 = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20),
                      // p8
                      const Text("Testing And Validatino"),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        value: p8,
                        divisions: 5,
                        activeColor: MyAppTheme.primaryColor,
                        onChanged: (dynamic value) {
                          setState(() {
                            p8 = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20),
                      // p9
                      const Text("Documentation"),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        value: p9,
                        divisions: 5,
                        activeColor: MyAppTheme.primaryColor,
                        onChanged: (dynamic value) {
                          setState(() {
                            p9 = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _updateGroupProgress();
                            },
                            child: Container(
                              height: 70,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                color: MyAppTheme.primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "Update Progress",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
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
      ),
    );
  }

  Future<void> getAttendence(String gid) async {
    var res = await http.post(
        Uri.parse(
            "https://project-pilot.000webhostapp.com/API/view_attandence.php"),
        body: {"gid": gid});

    print("group progress: ${res.body}");
    totalAttendence = jsonDecode(res.body)["count"];
    setState(() {});
  }

  Future<void> _updateGroupProgress() async {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Updating Progress Please Wait"),
          );
        });

    Map<String, String> body = {
      "p1": p1.toString(),
      "p2": p2.toString(),
      "p3": p3.toString(),
      "p4": p4.toString(),
      "p5": p5.toString(),
      "p6": p6.toString(),
      "p7": p7.toString(),
      "p8": p8.toString(),
      "p9": p9.toString(),
      "gid": widget.groupDataList[widget.index].gsid,
    };

    var progressUpdateRes = await http.post(
        Uri.parse(
            "https://project-pilot.000webhostapp.com/API/progress_update.php"),
        body: body);

    print("progress update: ${progressUpdateRes.body}");
    Navigator.pop(context);
    Navigator.pop(context);
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
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: MyAppTheme.primaryColor,
            offset: const Offset(10, 10),
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
                style: const TextStyle(
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
                margin: const EdgeInsets.only(right: 20),
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
