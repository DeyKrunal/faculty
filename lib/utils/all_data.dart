import 'package:project_management_system/models/faculty.dart';

import '../models/group.dart';

class ApiData{
  static bool totalGroupLoaded = false;
  static String totalGroups = "";
  static String totalStudents = "";
  static List<GroupData> groupDataList = [];
  static Faculty? facultyData;
}