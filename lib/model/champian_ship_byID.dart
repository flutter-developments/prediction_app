// To parse this JSON data, do
//
//     final csbyid = csbyidFromJson(jsonString);

import 'dart:convert';

CSBYID CSBYIDFromJson(String str) => CSBYID.fromJson(json.decode(str));

String csbyidToJson(CSBYID data) => json.encode(data.toJson());

class CSBYID {
  CSBYID({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory CSBYID.fromJson(Map<String, dynamic> json) => CSBYID(
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
    required this.games,
    required this.logopath,
  });

  List<Game> games;
  String logopath;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
        logopath: json["logopath"],
      );

  Map<String, dynamic> toJson() => {
        "games": List<dynamic>.from(games.map((x) => x.toJson())),
        "logopath": logopath,
      };
}

class Game {
  Game({
    required this.id,
    required this.sportId,
    required this.championshipId,
    required this.type,
    required this.team1Id,
    required this.team2Id,
    required this.startTime,
    required this.endTime,
    required this.isStatus,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int sportId;
  int championshipId;
  int type;
  int team1Id;
  int team2Id;
  DateTime startTime;
  DateTime endTime;
  int isStatus;
  int createdBy;
  int updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        sportId: json["sport_id"],
        championshipId: json["championship_id"],
        type: json["type"],
        team1Id: json["team1id"],
        team2Id: json["team2id"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        isStatus: json["is_status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sport_id": sportId,
        "championship_id": championshipId,
        "type": type,
        "team1id": team1Id,
        "team2id": team2Id,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
        "is_status": isStatus,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
