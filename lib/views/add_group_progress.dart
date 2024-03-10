import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_management_system/models/group.dart';
import 'package:project_management_system/utils/all_data.dart';
import 'package:project_management_system/utils/constants.dart';
import 'package:project_management_system/utils/thems.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_sliders/sliders.dart';

class GroupProgress extends StatefulWidget {
  int index;

  GroupProgress({super.key, required this.index});

  @override
  State<GroupProgress> createState() => _GroupProgressState();
}

class _GroupProgressState extends State<GroupProgress> {
  String totalAttendence = "0";
  double p1 = 0, p2 = 0, p3 = 0, p4 = 0, p5 = 0, p6 = 0, p7 = 0, p8 = 0, p9 = 0;
  var x;

  @override
  void initState() {
    super.initState();
    getAttendence(ApiData.groupDataList[widget.index].grpid);
    getProgress(ApiData.groupDataList[widget.index].grpid);
    x = ApiData.groupDataList[widget.index].gsid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfff5f6fb),
      appBar: AppBar(
        title: const Text("Group Details"),
        centerTitle: true,
      ),
      body: PopScope(
        onPopInvoked: (didPop) {},
        child: SingleChildScrollView(
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
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(top: 30),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Total Attendece: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            " ${ApiData.groupDataList[widget.index].count}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Group Progress",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: MyAppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),

                      // Progress one
                      const Text("Progress one: "),
                      SfSlider(
                        min: 0.0,
                        max: 100.0,
                        activeColor: MyAppTheme.primaryColor,
                        value: p1,
                        interval: 20,
                        showTicks: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          setState(() {
                            p1 = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),

                      // Progress two
                      const Text("Progress two: "),
                      SfSlider(
                        min: 0.0,
                        max: 100.0,
                        activeColor: MyAppTheme.primaryColor,
                        value: p2.toDouble(),
                        interval: 20,
                        showTicks: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          setState(() {
                            p2 = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),

                      // Progress three
                      const Text("Progress three: "),
                      SfSlider(
                        min: 0.0,
                        max: 100.0,
                        activeColor: MyAppTheme.primaryColor,
                        value: p3.toDouble(),
                        interval: 20,
                        showTicks: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          setState(() {
                            p3 = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),

                      // Progress four
                      const Text("Progress four: "),
                      SfSlider(
                        min: 0.0,
                        max: 100.0,
                        activeColor: MyAppTheme.primaryColor,
                        value: p4.toDouble(),
                        interval: 20,
                        showTicks: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          setState(() {
                            p4 = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),

                      // Progress five
                      const Text("Progress five: "),
                      SfSlider(
                        min: 0.0,
                        max: 100.0,
                        activeColor: MyAppTheme.primaryColor,
                        value: p5.toDouble(),
                        interval: 20,
                        showTicks: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          setState(() {
                            p5 = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),

                      // Progress six
                      const Text("Progress six: "),
                      SfSlider(
                        min: 0.0,
                        max: 100.0,
                        activeColor: MyAppTheme.primaryColor,
                        value: p6.toDouble(),
                        interval: 20,
                        showTicks: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          setState(() {
                            p6 = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),

                      // Progress seven
                      const Text("Progress seven: "),
                      SfSlider(
                        min: 0.0,
                        max: 100.0,
                        activeColor: MyAppTheme.primaryColor,
                        value: p7.toDouble(),
                        interval: 20,
                        showTicks: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          setState(() {
                            p7 = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),

                      // Progress eight
                      const Text("Progress eight: "),
                      SfSlider(
                        min: 0.0,
                        max: 100.0,
                        activeColor: MyAppTheme.primaryColor,
                        value: p8.toDouble(),
                        interval: 20,
                        showTicks: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          setState(() {
                            p8 = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),

                      // Progress nine
                      const Text("Progress nine: "),
                      SfSlider(
                        min: 0.0,
                        max: 100.0,
                        activeColor: MyAppTheme.primaryColor,
                        value: p9.toDouble(),
                        interval: 20,
                        showTicks: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          setState(() {
                            p9 = value;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          _updateProgress();
                        },
                        child: Container(
                          width: 300,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: MyAppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          child: const Text(
                            'Update Progress',
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
                )
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

    // print("group progress: ${res.body}");
    totalAttendence = jsonDecode(res.body)["count"];
    setState(() {});
  }

  Future<void> getProgress(String gid) async {
    var res = await http.post(
        Uri.parse(
            "https://project-pilot.000webhostapp.com/API/progress_api.php"),
        body: {"grp_id": gid});

    // totalAttendence = jsonDecode(res.body)["count"];
    setState(() {
      p1 = double.parse(jsonDecode(res.body)["p1"].toString());
      p2 = double.parse(jsonDecode(res.body)["p2"].toString());
      p3 = double.parse(jsonDecode(res.body)["p3"].toString());
      p4 = double.parse(jsonDecode(res.body)["p4"].toString());
      p5 = double.parse(jsonDecode(res.body)["p5"].toString());
      p6 = double.parse(jsonDecode(res.body)["p6"].toString());
      p7 = double.parse(jsonDecode(res.body)["p7"].toString());
      p8 = double.parse(jsonDecode(res.body)["p8"].toString());
      p9 = double.parse(jsonDecode(res.body)["p9"].toString());
    });
  }

  Future<void> _updateProgress() async {
    var res = await http.post(
      Uri.parse(
          "https://project-pilot.000webhostapp.com/API/progress_update.php"),
      body: {
        "p1": "$p1",
        "p2": "$p2",
        "p3": "$p3",
        "p4": "$p4",
        "p5": "$p5",
        "p6": "$p6",
        "p7": "$p7",
        "p8": "$p8",
        "p9": "$p9",
        "gid": "${ApiData.groupDataList[widget.index].grpid}",
      },
    );
    print("*** progress update: ${res.body}");
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
