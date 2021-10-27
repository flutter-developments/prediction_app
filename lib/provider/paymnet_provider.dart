import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prediction_app/model/response_model/paymentModel.dart';
import 'package:prediction_app/request/payment.dart';
import 'package:prediction_app/utils/images.dart';

class PaymnetProvider with ChangeNotifier {
  late bool action, wait = false;
  // ignore: unused_field
  late PaymentOffers paymentOffers;
  Future<PaymentOffers?> paymnetOffersStatus() async {
    _waitingState(true);
    await PaymnetApi().getPaymnetsOffers().then((data) {
      print("STATUS CODE => " + data.statusCode.toString());
      print("DATA => " + data.body.toString());

      if (data.statusCode == 200) {
        _setPaymentOffers(PaymentOffers.fromJson(json.decode(data.body)));
      } else if (data.statusCode == 404) {
        showMessageError(data.statusCode);
      } else if (data.statusCode == 403) {
        showMessageError(data.statusCode.toString());
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        print("Errors = " + result.toString());
        showMessageError(data.statusCode);
      }
    });

    return paymentOffers;
  }

  _setPaymentOffers(value) {
    paymentOffers = value;
    print("Message = " + paymentOffers.message.toString());
    notifyListeners();
  }

  _waitingState(value) {
    wait = value;
    // notifyListeners();
  }
}
