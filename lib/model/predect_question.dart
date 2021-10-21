// To parse this JSON data, do
//
//     final gamedetaile = gamedetaileFromJson(jsonString);

import 'dart:convert';

GAMEDETAILE gamedetaileFromJson(String str) =>
    GAMEDETAILE.fromJson(json.decode(str));

String gamedetaileToJson(GAMEDETAILE data) => json.encode(data.toJson());

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
    required this.teams,
    required this.logopath,
  });

  Games games;
  Teams teams;
  String logopath;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        games: Games.fromJson(json["games"]),
        teams: Teams.fromJson(json["teams"]),
        logopath: json["logopath"],
      );

  Map<String, dynamic> toJson() => {
        "games": games.toJson(),
        "teams": teams.toJson(),
        "logopath": logopath,
      };
}

class Games {
  Games({
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
    required this.questions,
    required this.answers,
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
  List<Question> questions;
  List<Answer> answers;

  factory Games.fromJson(Map<String, dynamic> json) => Games(
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
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
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
    required this.points,
    required this.teamId,
    required this.isTrue,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int gameId;
  int questionId;
  String answer;
  double points;
  int teamId;
  int isTrue;
  int createdBy;
  int updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        gameId: json["game_id"],
        questionId: json["question_id"],
        answer: json["answer"],
        points: json["points"].toDouble(),
        teamId: json["team_id"],
        isTrue: json["is_true"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "game_id": gameId,
        "question_id": questionId,
        "answer": answer,
        "points": points,
        "team_id": teamId,
        "is_true": isTrue,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Question {
  Question({
    required this.id,
    required this.gameId,
    required this.question,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int gameId;
  String question;
  int createdBy;
  int updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        gameId: json["game_id"],
        question: json["question"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "game_id": gameId,
        "question": question,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Teams {
  Teams({
    required this.team1,
    required this.team2,
  });

  List<Team> team1;
  List<Team> team2;

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        team1: List<Team>.from(json["team1"].map((x) => Team.fromJson(x))),
        team2: List<Team>.from(json["team2"].map((x) => Team.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "team1": List<dynamic>.from(team1.map((x) => x.toJson())),
        "team2": List<dynamic>.from(team2.map((x) => x.toJson())),
      };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.logo,
    required this.isStatus,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String logo;
  int isStatus;
  int createdBy;
  int updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        isStatus: json["is_status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "is_status": isStatus,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
