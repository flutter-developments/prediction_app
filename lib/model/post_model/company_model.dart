// To parse this JSON data, do
//
//     final ComapnyCreationModel = ComapnyCreationModelFromJson(jsonString);

import 'dart:convert';

ComapnyCreationModel comapnyCreationModelFromJson(String str) =>
    ComapnyCreationModel.fromJson(json.decode(str));

String comapnyCreationModelToJson(ComapnyCreationModel data) =>
    json.encode(data.toJson());

class ComapnyCreationModel {
  ComapnyCreationModel({
    this.success,
    this.message,
    this.details,
  });

  bool? success;
  String? message;
  Details? details;

  factory ComapnyCreationModel.fromJson(Map<String, dynamic> json) =>
      ComapnyCreationModel(
        success: json["success"],
        message: json["message"],
        details: Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "details": details!.toJson(),
      };
}

class Details {
  Details({
    this.logoUrl,
    this.ads,
    this.id,
    this.name,
    this.about,
    this.address,
    this.gstHst,
    this.pst,
    this.category,
    this.subCategory,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  dynamic logoUrl;
  List<dynamic>? ads;
  String? id;
  String? name;
  String? about;
  String? address;
  String? gstHst;
  String? pst;
  String? category;
  String? subCategory;
  String? user;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        logoUrl: json["logoURL"],
        ads: List<dynamic>.from(json["ads"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        about: json["about"],
        address: json["address"],
        gstHst: json["gst_hst"],
        pst: json["pst"],
        category: json["category"],
        subCategory: json["subCategory"],
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "logoURL": logoUrl,
        "ads": List<dynamic>.from(ads!.map((x) => x)),
        "_id": id,
        "name": name,
        "about": about,
        "address": address,
        "gst_hst": gstHst,
        "pst": pst,
        "category": category,
        "subCategory": subCategory,
        "user": user,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
