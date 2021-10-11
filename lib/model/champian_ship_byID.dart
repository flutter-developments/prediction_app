// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CSBYID welcomeFromJson(String str) => CSBYID.fromJson(json.decode(str));

String welcomeToJson(CSBYID data) => json.encode(data.toJson());

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
  });

  List<Game> games;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "games": List<dynamic>.from(games.map((x) => x.toJson())),
      };
}

class Game {
  Game({
    required this.id,
    required this.sportId,
    required this.championshipId,
    required this.type,
    required this.team1,
    required this.team1Logo,
    required this.team2,
    required this.team2Logo,
    required this.startTime,
    required this.endTime,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int sportId;
  int championshipId;
  int type;
  String team1;
  String team1Logo;
  String team2;
  String team2Logo;
  DateTime startTime;
  DateTime endTime;
  int createdBy;
  int updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        sportId: json["sport_id"],
        championshipId: json["championship_id"],
        type: json["type"],
        team1: json["team1"],
        team1Logo: json["team1Logo"],
        team2: json["team2"],
        team2Logo: json["team2Logo"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
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
        "team1": team1,
        "team1Logo": team1Logo,
        "team2": team2,
        "team2Logo": team2Logo,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
