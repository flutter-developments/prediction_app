// To parse this JSON data, do
//
//     final PostReview = PostReviewFromJson(jsonString);

import 'dart:convert';

PostReview welcomeFromJson(String str) => PostReview.fromJson(json.decode(str));

String welcomeToJson(PostReview data) => json.encode(data.toJson());

class PostReview {
  PostReview({
    this.success,
    this.message,
    this.data,
    this.id,
  });

  bool? success;
  String? message;
  Data? data;
  int? id;

  factory PostReview.fromJson(Map<String, dynamic> json) => PostReview(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
        "id": id,
      };
}

class Data {
  Data({
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
  String? rater;
  String? ratee;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        rating: json["rating"],
        id: json["_id"],
        comment: json["comment"],
        rater: json["rater"],
        ratee: json["ratee"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "_id": id,
        "comment": comment,
        "rater": rater,
        "ratee": ratee,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
