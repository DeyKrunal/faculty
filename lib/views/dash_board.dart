import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_management_system/utils/constants.dart';
import 'package:project_management_system/utils/thems.dart';
import 'package:project_management_system/views/group_details.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import '../utils/all_data.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool reload = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _totalGroupLoaded = false;
    print("FID: ${Constants.prefs!.getString("fid")}");
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5)).then((value) {
      // build(context);
      setState(() {
        reload = true;
      });
    });

    return SafeArea(
      child: Column(
        children: [
          // App bar
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${DateFormat('MMM').format(DateTime.now())} ${DateTime.now().day}, ${DateTime.now().year}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            ApiData.facultyData?.fName ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/men.jpg"),
                            ),
                            border: Border.all(color: Colors.black12),
                            shape: BoxShape.circle),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color(0xff61c877),
                            ),
                            alignment: Alignment.center,
                            child: ApiData.totalGroupLoaded
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total Groups",
                                        style: MyAppTheme.cardStyle,
                                      ),
                                      Text(
                                        "${ApiData.totalGroups}",
                                        style: MyAppTheme.cardStyle.copyWith(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                : const CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color(0xffff6157),
                            ),
                            alignment: Alignment.center,
                            child: ApiData.totalGroupLoaded
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total Students",
                                        style: MyAppTheme.cardStyle,
                                      ),
                                      Text(
                                        "${ApiData.totalStudents}",
                                        style: MyAppTheme.cardStyle.copyWith(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                : const CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Group List
          Container(
            margin:
                const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Manage Attendence",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Group List"),
              ],
            ),
          ),

          Expanded(
            child: Container(
              // height: 295,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ApiData.totalGroupLoaded
                    ? Colors.transparent
                    : Colors.white,
                borderRadius:
                    BorderRadius.circular(ApiData.totalGroupLoaded ? 0 : 20),
              ),
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              alignment: Alignment.center,
              child: ApiData.totalGroupLoaded
                  ? ListView.builder(
                      itemCount: ApiData.groupDataList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // print("ID = ${ApiData.groupDataList[index].gsid}");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      GroupDetails(index: index),
                                ));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.group,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ApiData
                                                .groupDataList[index].groupName,
                                            style: MyAppTheme.cardStyle
                                                .copyWith(color: Colors.black),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            width: 200,
                                            child: ProgressBar(
                                              value: ApiData
                                                      .groupDataList[index]
                                                      .count! /
                                                  100,
                                              // value: ApiData.groupDataList[index].count / 100,
                                              width: 150,
                                              backgroundColor:
                                                  Color(0xffeff0f6),
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xffffce93),
                                                  Color(0xffffce93),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: Icon(Icons.arrow_forward_ios),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        // Customize your shimmer base color
                        highlightColor: Colors.grey[100]!,
                        // Customize your shimmer highlight color
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
