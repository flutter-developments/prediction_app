// To parse this JSON data, do
//
//     final GetReviews = GetReviewsFromJson(jsonString);

import 'dart:convert';

GetReviews welcomeFromJson(String str) => GetReviews.fromJson(json.decode(str));

String welcomeToJson(GetReviews data) => json.encode(data.toJson());

class GetReviews {
  GetReviews({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Datum>? data;

  factory GetReviews.fromJson(Map<String, dynamic> json) => GetReviews(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.rating,
    this.id,
    this.comment,
    this.rater,
    this.ratee,
    this.createdAt,
    this.updatedAt,
  });

  num? rating;
  String? id;
  String? comment;
  dynamic rater;
  Ratee? ratee;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        rating: json["rating"],
        id: json["_id"],
        comment: json["comment"],
        rater: json["rater"],
        ratee: json["ratee"] == null ? null : Ratee.fromJson(json["ratee"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "_id": id,
        "comment": comment,
        "rater": rater,
        "ratee": ratee == null ? null : ratee!.toJson(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class Ratee {
  Ratee({
    this.displayPictureURL,
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

  dynamic displayPictureURL;
  String? id;
  String? email;
  String? firstName;
  String? lastName;

  factory Ratee.fromJson(Map<String, dynamic> json) => Ratee(
        displayPictureURL: json["displayPictureURL"],
        id: json["_id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "displayPictureURL": displayPictureURL,
        "_id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
      };
}
