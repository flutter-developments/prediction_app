// To parse this JSON data, do
//
//     final championshipModel = championshipModelFromJson(jsonString);

import 'dart:convert';

ChampionshipModel championshipModelFromJson(String str) =>
    ChampionshipModel.fromJson(json.decode(str));

String championshipModelToJson(ChampionshipModel data) =>
    json.encode(data.toJson());

class ChampionshipModel {
  ChampionshipModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory ChampionshipModel.fromJson(Map<String, dynamic> json) =>
      ChampionshipModel(
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

  Sports sports;
  String logopath;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sports: Sports.fromJson(json["sports"]),
        logopath: json["logopath"],
      );

  Map<String, dynamic> toJson() => {
        "sports": sports.toJson(),
        "logopath": logopath,
      };
}

class Sports {
  Sports({
    required this.id,
    required this.name,
    required this.logo,
    required this.isStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.championships,
    required this.sportsId,
  });

  int id;
  String name;
  String logo;
  int isStatus;
  DateTime createdAt;
  DateTime updatedAt;
  List<Sports>? championships;
  int sportsId;

  factory Sports.fromJson(Map<String, dynamic> json) => Sports(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        isStatus: json["is_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        championships: json["championships"] == null
            ? null
            : List<Sports>.from(
                json["championships"].map((x) => Sports.fromJson(x))),
        sportsId: json["sports_id"] == null ? 0 : json["sports_id"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "is_status": isStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "championships": championships == null
            ? null
            : List<dynamic>.from(championships!.map((x) => x.toJson())),
        "sports_id": sportsId == null ? 0 : sportsId,
      };
}
