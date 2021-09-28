// To parse this JSON data, do
//
//     final SPORTSMODEL = welcomeFromJson(jsonString);

import 'dart:convert';

SPORTSMODEL welcomeFromJson(String str) =>
    SPORTSMODEL.fromJson(json.decode(str));

String welcomeToJson(SPORTSMODEL data) => json.encode(data.toJson());

class SPORTSMODEL {
  SPORTSMODEL({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory SPORTSMODEL.fromJson(Map<String, dynamic> json) => SPORTSMODEL(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
