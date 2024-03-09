import 'dart:convert';
import 'dart:ffi';

class GroupData {
  String gsid;
  String name1;
  String rn1;
  String div1;
  String phno1;
  String email1;
  String name2;
  String rn2;
  String div2;
  String phno2;
  String email2;
  String name3;
  String rn3;
  String div3;
  String phno3;
  String email3;
  String name4;
  String rn4;
  String div4;
  String phno4;
  String email4;
  String image;
  String facultyId;
  String groupName;
  String pass;
  String status;
  String proid;
  String grpid;
  String p1;
  String p2;
  String p3;
  String p4;
  String p5;
  String p6;
  String p7;
  String p8;
  String p9;
  String date;
  dynamic count;

  GroupData({
    required this.gsid,
    required this.name1,
    required this.rn1,
    required this.div1,
    required this.phno1,
    required this.email1,
    required this.name2,
    required this.rn2,
    required this.div2,
    required this.phno2,
    required this.email2,
    required this.name3,
    required this.rn3,
    required this.div3,
    required this.phno3,
    required this.email3,
    required this.name4,
    required this.rn4,
    required this.div4,
    required this.phno4,
    required this.email4,
    required this.image,
    required this.facultyId,
    required this.groupName,
    required this.pass,
    required this.status,
    required this.proid,
    required this.grpid,
    required this.p1,
    required this.p2,
    required this.p3,
    required this.p4,
    required this.p5,
    required this.p6,
    required this.p7,
    required this.p8,
    required this.p9,
    required this.date,
    required this.count,
  });

  factory GroupData.fromJson(Map<String, dynamic> json) => GroupData(
        gsid: json["gsid"] ?? "",
        name1: json["name1"] ?? "",
        rn1: json["rn1"] ?? "",
        div1: json["div1"] ?? "",
        phno1: json["phno1"] ?? "",
        email1: json["email1"] ?? "",
        name2: json["name2"] ?? "",
        rn2: json["rn2"] ?? "",
        div2: json["div2"] ?? "",
        phno2: json["phno2"] ?? "",
        email2: json["email2"] ?? "",
        name3: json["name3"] ?? "",
        rn3: json["rn3"] ?? "",
        div3: json["div3"] ?? "",
        phno3: json["phno3"] ?? "",
        email3: json["email3"] ?? "",
        name4: json["name4"] ?? "",
        rn4: json["rn4"] ?? "",
        div4: json["div4"] ?? "",
        phno4: json["phno4"] ?? "",
        email4: json["email4"] ?? "",
        image: json["image"],
        facultyId: json["faculty_id"],
        groupName: json["group_name"],
        pass: json["pass"],
        status: json["status"],
        proid: json["proid"],
        grpid: json["grpid"],
        p1: json["p1"],
        p2: json["p2"],
        p3: json["p3"],
        p4: json["p4"],
        p5: json["p5"],
        p6: json["p6"],
        p7: json["p7"],
        p8: json["p8"],
        p9: json["p9"],
        date: json["date"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "gsid": gsid,
        "name1": name1,
        "rn1": rn1,
        "div1": div1,
        "phno1": phno1,
        "email1": email1,
        "name2": name2,
        "rn2": rn2,
        "div2": div2,
        "phno2": phno2,
        "email2": email2,
        "name3": name3,
        "rn3": rn3,
        "div3": div3,
        "phno3": phno3,
        "email3": email3,
        "name4": name4,
        "rn4": rn4,
        "div4": div4,
        "phno4": phno4,
        "email4": email4,
        "image": image,
        "faculty_id": facultyId,
        "group_name": groupName,
        "pass": pass,
        "status": status,
        "proid": proid,
        "grpid": grpid,
        "p1": p1,
        "p2": p2,
        "p3": p3,
        "p4": p4,
        "p5": p5,
        "p6": p6,
        "p7": p7,
        "p8": p8,
        "p9": p9,
        "date": date,
        "count": count,
      };
}
