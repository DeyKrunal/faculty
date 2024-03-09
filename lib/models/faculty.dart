class Faculty {
  String fid;
  String fName;
  String fEmail;
  String fPhno;
  String fImg;
  String fDesc;
  String fQualif;
  String fExp;
  String fAddress;
  String fPwd;

  Faculty({
    required this.fid,
    required this.fName,
    required this.fEmail,
    required this.fPhno,
    required this.fImg,
    required this.fDesc,
    required this.fQualif,
    required this.fExp,
    required this.fAddress,
    required this.fPwd,
  });

  factory Faculty.fromJson(Map json) => Faculty(
    fid: json["fid"],
    fName: json["f_name"],
    fEmail: json["f_email"],
    fPhno: json["f_phno"],
    fImg: json["f_img"],
    fDesc: json["f_desc"],
    fQualif: json["f_qualif"],
    fExp: json["f_exp"],
    fAddress: json["f_address"],
    fPwd: json["f_pwd"],
  );

  Map<String, dynamic> toJson() => {
    "fid": fid,
    "f_name": fName,
    "f_email": fEmail,
    "f_phno": fPhno,
    "f_img": fImg,
    "f_desc": fDesc,
    "f_qualif": fQualif,
    "f_exp": fExp,
    "f_address": fAddress,
    "f_pwd": fPwd,
  };
}
