// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

REGISTERMODEL welcomeFromJson(String str) =>
    REGISTERMODEL.fromJson(json.decode(str));

String welcomeToJson(REGISTERMODEL data) => json.encode(data.toJson());

class REGISTERMODEL {
  REGISTERMODEL({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory REGISTERMODEL.fromJson(Map<String, dynamic> json) => REGISTERMODEL(
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
    required this.token,
    required this.name,
  });

  Token token;
  String name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: Token.fromJson(json["token"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token.toJson(),
        "name": name,
      };
}

class Token {
  Token({
    required this.name,
    required this.abilities,
    required this.tokenableId,
    required this.tokenableType,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String name;
  List<String> abilities;
  int tokenableId;
  String tokenableType;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        name: json["name"],
        abilities: List<String>.from(json["abilities"].map((x) => x)),
        tokenableId: json["tokenable_id"],
        tokenableType: json["tokenable_type"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "abilities": List<dynamic>.from(abilities.map((x) => x)),
        "tokenable_id": tokenableId,
        "tokenable_type": tokenableType,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
