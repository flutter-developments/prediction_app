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
  Data data;
  String message;

  factory SPORTSMODEL.fromJson(Map<String, dynamic> json) => SPORTSMODEL(
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
    required this.sports,
    required this.logopath,
  });

  List<Sport> sports;
  String logopath;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sports: List<Sport>.from(json["sports"].map((x) => Sport.fromJson(x))),
        logopath: json["logopath"],
      );

  Map<String, dynamic> toJson() => {
        "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
        "logopath": logopath,
      };
}

class Sport {
  Sport({
    required this.id,
    required this.name,
    required this.logo,
    required this.isStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String logo;
  int isStatus;
  DateTime createdAt;
  DateTime updatedAt;

  factory Sport.fromJson(Map<String, dynamic> json) => Sport(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        isStatus: json["is_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "is_status": isStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
