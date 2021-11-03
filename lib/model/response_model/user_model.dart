// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
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
    required this.user,
    required this.totalPrediction,
    required this.completePrediction,
    required this.winPrediction,
    required this.losePrediction,
    required this.pendingPrediction,
    required this.winRate,
    required this.playedGames,
    required this.completeGames,
    required this.pendingGames,
  });

  User user;
  int totalPrediction;
  int completePrediction;
  int winPrediction;
  int losePrediction;
  int pendingPrediction;
  int winRate;
  int playedGames;
  int completeGames;
  int pendingGames;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        totalPrediction: json["totalPrediction"],
        completePrediction: json["completePrediction"],
        winPrediction: json["winPrediction"],
        losePrediction: json["losePrediction"],
        pendingPrediction: json["pendingPrediction"],
        winRate: json["winRate"],
        playedGames: json["playedGames"],
        completeGames: json["completeGames"],
        pendingGames: json["pendingGames"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "totalPrediction": totalPrediction,
        "completePrediction": completePrediction,
        "winPrediction": winPrediction,
        "losePrediction": losePrediction,
        "pendingPrediction": pendingPrediction,
        "winRate": winRate,
        "playedGames": playedGames,
        "completeGames": completeGames,
        "pendingGames": pendingGames,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
  });

  int id;
  String name;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}
