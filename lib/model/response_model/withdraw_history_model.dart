// To parse this JSON data, do
//
//     final withdrawHistory = withdrawHistoryFromJson(jsonString);

import 'dart:convert';

WithdrawHistory withdrawHistoryFromJson(String str) =>
    WithdrawHistory.fromJson(json.decode(str));

String withdrawHistoryToJson(WithdrawHistory data) =>
    json.encode(data.toJson());

class WithdrawHistory {
  WithdrawHistory({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory WithdrawHistory.fromJson(Map<String, dynamic> json) =>
      WithdrawHistory(
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
    required this.history,
    required this.logopath,
  });

  List<History> history;
  String logopath;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        history:
            List<History>.from(json["history"].map((x) => History.fromJson(x))),
        logopath: json["logopath"],
      );

  Map<String, dynamic> toJson() => {
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
        "logopath": logopath,
      };
}

class History {
  History({
    required this.id,
    required this.userId,
    required this.email,
    required this.amount,
    required this.methodId,
    required this.isStatus,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.methodName,
    required this.logo,
  });

  int id;
  int userId;
  String email;
  int amount;
  int methodId;
  int isStatus;
  int createdBy;
  int updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String methodName;
  String logo;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        userId: json["user_id"],
        email: json["email"],
        amount: json["amount"],
        methodId: json["method_id"],
        isStatus: json["is_status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        methodName: json["method_name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "email": email,
        "amount": amount,
        "method_id": methodId,
        "is_status": isStatus,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "method_name": methodName,
        "logo": logo,
      };
}
