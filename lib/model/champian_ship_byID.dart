// To parse this JSON data, do
//
//     final championshipById = championshipByIdFromJson(jsonString);

import 'dart:convert';

ChampionshipById championshipByIdFromJson(String str) =>
    ChampionshipById.fromJson(json.decode(str));

String championshipByIdToJson(ChampionshipById data) =>
    json.encode(data.toJson());

class ChampionshipById {
  ChampionshipById({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory ChampionshipById.fromJson(Map<String, dynamic> json) =>
      ChampionshipById(
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
    required this.team1Id,
    required this.team2Id,
    required this.championship,
    required this.team1Name,
    required this.team2Name,
    required this.team1Logo,
    required this.team2Logo,
    required this.startTime,
    required this.endTime,
  });

  int id;
  int sportId;
  int championshipId;
  int team1Id;
  int team2Id;
  String championship;
  String team1Name;
  String team2Name;
  String team1Logo;
  String team2Logo;
  DateTime startTime;
  DateTime endTime;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        sportId: json["sport_id"],
        championshipId: json["championship_id"],
        team1Id: json["team1id"],
        team2Id: json["team2id"],
        championship: json["championship"],
        team1Name: json["team1_name"],
        team2Name: json["team2_name"],
        team1Logo: json["team1_logo"],
        team2Logo: json["team2_logo"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sport_id": sportId,
        "championship_id": championshipId,
        "team1id": team1Id,
        "team2id": team2Id,
        "championship": championship,
        "team1_name": team1Name,
        "team2_name": team2Name,
        "team1_logo": team1Logo,
        "team2_logo": team2Logo,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
      };
}
