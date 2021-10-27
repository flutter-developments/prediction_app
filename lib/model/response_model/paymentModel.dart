import 'dart:convert';

PaymentOffers paymentOffersFromJson(String str) =>
    PaymentOffers.fromJson(json.decode(str));

String paymentOffersToJson(PaymentOffers data) => json.encode(data.toJson());

class PaymentOffers {
  PaymentOffers({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory PaymentOffers.fromJson(Map<String, dynamic> json) => PaymentOffers(
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
    required this.paymentMethods,
    required this.logopath,
  });

  List<PaymentMethod> paymentMethods;
  String logopath;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paymentMethods: List<PaymentMethod>.from(
            json["payment_methods"].map((x) => PaymentMethod.fromJson(x))),
        logopath: json["logopath"],
      );

  Map<String, dynamic> toJson() => {
        "payment_methods":
            List<dynamic>.from(paymentMethods.map((x) => x.toJson())),
        "logopath": logopath,
      };
}

class PaymentMethod {
  PaymentMethod({
    required this.id,
    required this.name,
    required this.exchangeRate,
    required this.logo,
    required this.isStatus,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String exchangeRate;
  String logo;
  int isStatus;
  int createdBy;
  int updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        id: json["id"],
        name: json["name"],
        exchangeRate: json["exchange_rate"],
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
        "exchange_rate": exchangeRate,
        "logo": logo,
        "is_status": isStatus,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
