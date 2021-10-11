// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

GAMEDETAILE welcomeFromJson(String str) =>
    GAMEDETAILE.fromJson(json.decode(str));

String welcomeToJson(GAMEDETAILE data) => json.encode(data.toJson());

class GAMEDETAILE {
  GAMEDETAILE({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory GAMEDETAILE.fromJson(Map<String, dynamic> json) => GAMEDETAILE(
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

  Games games;
  String logopath;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        games: Games.fromJson(json["games"]),
        logopath: json["logopath"],
      );

  Map<String, dynamic> toJson() => {
        "games": games.toJson(),
        "logopath": logopath,
      };
}

class Games {
  Games({
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
    required this.questions,
    required this.answers,
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
  List<Answer> questions;
  List<Answer> answers;

  factory Games.fromJson(Map<String, dynamic> json) => Games(
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
        questions:
            List<Answer>.from(json["questions"].map((x) => Answer.fromJson(x))),
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
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
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    required this.id,
    required this.gameId,
    required this.questionId,
    required this.answer,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.question,
  });

  int id;
  int gameId;
  int? questionId;
  String? answer;
  int createdBy;
  int updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String? question;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        gameId: json["game_id"],
        questionId: json["question_id"] == null ? 0 : json["question_id"],
        answer: json["answer"] == null ? null : json["answer"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        question: json["question"] == null ? null : json["question"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "game_id": gameId,
        "question_id": questionId == null ? null : questionId,
        "answer": answer == null ? null : answer,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "question": question == null ? null : question,
      };
}
