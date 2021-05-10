// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.avatar,
    this.email,
    this.events,
    this.name,
    this.password,
    this.phone,
    this.reg,
  });

  String avatar;
  String email;
  String events;
  String name;
  String password;
  String phone;
  String reg;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    avatar: json["avatar"],
    email: json["email"],
    events: json["events"],
    name: json["name"],
    password: json["password"],
    phone: json["phone"],
    reg: json["reg"],
  );
  Map<String, dynamic> toJson() => {
    "avatar": avatar,
    "email": email,
    "events": events,
    "name": name,
    "password": password,
    "phone": phone,
    "reg": reg,
  };
}
