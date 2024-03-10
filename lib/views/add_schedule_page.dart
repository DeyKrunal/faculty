import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/event.dart';
import 'package:project_management_system/utils/constants.dart';
import 'package:project_management_system/utils/thems.dart';
import 'package:table_calendar/table_calendar.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({super.key});

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.week;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  TimeOfDay startTTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  late List<Map<String, dynamic>> jsondata;
  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedEvents = {};
    // Fetch schedule data when the widget is initialized
    fetchScheduleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F5FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(29.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                child: TableCalendar(
                  focusedDay: selectedDay,
                  firstDay: DateTime(1990),
                  lastDay: DateTime(2050),
                  calendarFormat: format,
                  onFormatChanged: (CalendarFormat _format) {
                    setState(() {
                      format = _format;
                    });
                  },
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  daysOfWeekVisible: true,
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    setState(() {
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                      print(
                          "*** event for day: ${selectedEvents[DateTime.parse("${selectedDay.toString()}").toLocal()]}");
                      print(
                          "*** selected day: ${DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(selectDay)}");
                      print("*** selected day: $selectedDay}");
                    });
                  },
                  selectedDayPredicate: (DateTime date) {
                    return isSameDay(selectedDay, date);
                  },
                  eventLoader: (day) => _getEventsfromDay(day),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List? jsonData = snapshot.data;
                        return Column(
                          children: jsonData!
                              .map((data) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16.0),
                                  child: Card(
                                    elevation: 3,
                                    child: ListTile(
                                      tileColor: Colors.white54,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 10.0),
                                      leading: const Icon(Icons.event,
                                          color: Colors.blue),
                                      title: Text(
                                        data['title'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 5.0),
                                          Text(
                                            'Date: ${data['date']}',
                                            style: const TextStyle(
                                                color: Colors.black87),
                                          ),
                                          const SizedBox(height: 5.0),
                                          Text(
                                            'Time: ${DateFormat.jm().format(DateFormat("HH:mm:ss").parse(data['start']))} - ${DateFormat.jm().format(DateFormat("HH:mm:ss").parse(data['end']))}',
                                            style: const TextStyle(
                                                color: Colors.black87),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                              .toList()
                              .reversed
                              .toList(),
                        );
                      } else if (snapshot.hasError) {
                        return const Text('Error fetching data');
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: MyAppTheme.primaryColor,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => StatefulBuilder(builder: (context, setstate) {
            return AlertDialog(
              title: const Text("Add Event"),
              content: Container(
                height: 250,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _eventController,
                      decoration:
                          const InputDecoration(labelText: 'Event Title'),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              const Text("Start Time:"),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () async {
                                  final pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                            alwaysUse24HourFormat: false),
                                        child: child!,
                                      );
                                    },
                                  );
                                  setstate(() {
                                    startTTime = pickedTime!;
                                  });
                                  print("*** startTime: $startTTime");
                                },
                                child: const Text("Select Time"),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                  "${startTTime.hourOfPeriod}:${startTTime.minute} ${startTTime.period == DayPeriod.am ? 'AM' : 'PM'}"),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const Text("End Time:"),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () async {
                                final pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat: false),
                                      child: child!,
                                    );
                                  },
                                );
                                setstate(() {
                                  endTime = pickedTime!;
                                });
                                print("*** endTime: $endTime");
                              },
                              child: const Text("Select Time"),
                            ),
                            const SizedBox(height: 10),
                            Text(
                                "${endTime.hourOfPeriod}:${endTime.minute} ${endTime.period == DayPeriod.am ? 'AM' : 'PM'}"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () async {
                    if (_eventController.text.isEmpty) {
                      // Handle empty fields
                      return;
                    }

                    // Send request to add schedule
                    await addSchedule(
                      _eventController.text,
                      startTTime,
                      endTime,
                    );

                    // Close the dialog and clear the controller
                    Navigator.pop(context);
                    _eventController.clear();

                    // Fetch updated schedule data
                    await fetchScheduleData();
                  },
                ),
              ],
            );
          }),
        ),
        label: const Text(
          "Add Event",
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    date = date.toLocal();
    return selectedEvents[date] ?? [];
  }

  Future<List<dynamic>> fetchData() async {
    // Simulated JSON data
    final response = await http.post(
        Uri.parse(
            'https://project-pilot.000webhostapp.com/API/view_schedule.php'),
        body: {"fid": "${Constants.prefs!.getString("fid")}"});
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData;
  }

  Future<void> fetchScheduleData() async {
    final response = await http.post(
        Uri.parse(
            'https://project-pilot.000webhostapp.com/API/view_schedule.php'),
        body: {"fid": "${Constants.prefs!.getString("fid")}"});

    print("88 events data: ${response.body}");
    List<dynamic> data = jsonDecode(response.body);
    updateEvents(data);
  }

  Future<void> addSchedule(
      String eventTitle, TimeOfDay startTime, TimeOfDay endTime) async {
    final response = await http.post(
      Uri.parse(
          'https://project-pilot.000webhostapp.com/API/insert_schedule.php'),
      body: {
        'fid': '${Constants.prefs!.getString("fid")}',
        'date': flutterDateTimeToSqlDate(selectedDay),
        'start_time': flutterTimeOfDayToSqlTime(startTime),
        'remark': eventTitle,
        'end_time': flutterTimeOfDayToSqlTime(endTime),
      },
    );

    print("** add schedule: ${response.body}");

    // Check if the API call was successful before fetching updated schedule data
    if (response.statusCode == 200) {
      // Parse the response to get the added event details
      final addedEvent = jsonDecode(response.body);

      print("added event: ${addedEvent}");

      await fetchScheduleData();

      // Update the state to trigger a rebuild of the UI
      setState(() {});
    }
  }

  void updateEvents(List<dynamic> data) {
    selectedEvents = {};

    for (var item in data) {
      DateTime date = DateTime.parse(item['date']).toLocal();
      if (selectedEvents[date] == null) {
        selectedEvents[date] = [];
      }
      selectedEvents[date]?.add(Event(
        endTime: item["end"],
        startTime: item["start"],
        date: date,
        title: item['title'],
        // Add other properties as needed (start, end, etc.)
      ));
    }

    print("*** selected events: $selectedEvents");
    setState(() {});
  }

  Future<void> _selectTime(BuildContext context,
      {required bool isStartTime}) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          startTTime = pickedTime;
        } else {
          endTime = pickedTime;
        }
      });
    }
  }

  String flutterDateTimeToSqlDate(DateTime dateTime) {
    // Convert to local time zone
    dateTime = dateTime.toLocal();

    // Format as SQL date (yyyy-MM-dd)
    String formattedDate =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

    return formattedDate;
  }

  String flutterTimeOfDayToSqlTime(TimeOfDay timeOfDay) {
    // Format as SQL time (HH:mm:ss)
    String formattedTime =
        "${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}:00";

    return formattedTime;
  }
}
