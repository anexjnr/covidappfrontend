// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  String name;
  String symptomes;
  String mobile;
  String status;

  Welcome({
    required this.name,
    required this.symptomes,
    required this.mobile,
    required this.status,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    name: json["name"],
    symptomes: json["symptomes"],
    mobile: json["mobile"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "symptomes": symptomes,
    "mobile": mobile,
    "status": status,
  };
}
