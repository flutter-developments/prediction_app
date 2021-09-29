// To parse this JSON data, do
//
//     final ChampionshipModel = welcomeFromJson(jsonString);

import 'dart:convert';

ChampionshipModel welcomeFromJson(String str) =>
    ChampionshipModel.fromJson(json.decode(str));

String welcomeToJson(ChampionshipModel data) => json.encode(data.toJson());

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
  });

  Sports sports;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sports: Sports.fromJson(json["sports"]),
      );

  Map<String, dynamic> toJson() => {
        "sports": sports.toJson(),
      };
}

class Sports {
  Sports({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.championships,
    required this.sportsId,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  List<Sports>? championships;
  int sportsId;

  factory Sports.fromJson(Map<String, dynamic> json) => Sports(
        id: json["id"],
        name: json["name"],
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "championships": championships == null
            ? null
            : List<dynamic>.from(championships!.map((x) => x.toJson())),
        "sports_id": sportsId == null ? null : sportsId,
      };
}
