import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../utils/all_data.dart';
import '../utils/thems.dart';

class GroupList extends StatefulWidget {
  const GroupList({super.key});

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F5FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Text(
              "Group Details",
              style: MyAppTheme.cardStyle.copyWith(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(30),
                child: ListView.builder(
                  itemCount: ApiData.groupDataList.length,
                  itemBuilder: (context, index) {
                    return Container(
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
                                      // child: RoundedProgressBar(
                                      //   height: 20,
                                      //   childLeft: Text("40%",
                                      //       style: TextStyle(color: Colors.white)),
                                      //   percent: 40,
                                      //   theme: RoundedProgressBarTheme.yellow,
                                      // ),
                                      child: ProgressBar(
                                        value: 0.5,
                                        // value: ApiData.groupDataList[index].count / 100,
                                        width: 150,
                                        backgroundColor: Color(0xffeff0f6),
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
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
