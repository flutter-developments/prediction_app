import 'dart:convert';

LOGINMODEL welcomeFromJson(String str) => LOGINMODEL.fromJson(json.decode(str));

String welcomeToJson(LOGINMODEL data) => json.encode(data.toJson());

class LOGINMODEL {
  LOGINMODEL({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory LOGINMODEL.fromJson(Map<String, dynamic> json) => LOGINMODEL(
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

  String token;
  String name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
      };
}
