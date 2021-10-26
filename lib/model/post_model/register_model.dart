// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

REGISTERMODEL welcomeFromJson(String str) =>
    REGISTERMODEL.fromJson(json.decode(str));

String welcomeToJson(REGISTERMODEL data) => json.encode(data.toJson());

class REGISTERMODEL {
  REGISTERMODEL({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory REGISTERMODEL.fromJson(Map<String, dynamic> json) => REGISTERMODEL(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.token,
    required this.name,
  });

  String token;
  String name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
      };
}
