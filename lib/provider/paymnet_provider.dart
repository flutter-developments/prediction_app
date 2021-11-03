import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prediction_app/model/response_model/notification_model.dart';
import 'package:prediction_app/model/response_model/payment_model.dart';
import 'package:prediction_app/model/response_model/withdraw_history_model.dart';
import 'package:prediction_app/request/payment.dart';
import 'package:prediction_app/utils/images.dart';

class PaymnetProvider with ChangeNotifier {
  late bool action, wait = false;
  late PaymentOffers paymentOffers;
  late WithdrawHistory withdrawHistory;
  late NotificationsModel notificationsModel;

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

  Future<PaymentOffers?> withdrawPayment(
      userid, methodid, email, amount) async {
    _waitingState(true);
    await PaymnetApi()
        .getrequestForWithdraw(userid, methodid, email, amount)
        .then((data) {
      print("STATUS CODE => " + data.statusCode.toString());
      print("DATA => " + data.body.toString());
      if (data.statusCode == 200) {
        showMessageSuccess(data.body.toString());
      } else if (data.statusCode == 401) {
        showMessageError(data.body.toString());
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

  Future<WithdrawHistory?> withdrawPaymentHistory() async {
    _waitingState(true);
    await PaymnetApi().getPaymentHistory().then((data) {
      print("STATUS CODE => " + data.statusCode.toString());
      print("getPaymentHistory DATA => " + data.body.toString());

      if (data.statusCode == 200) {
        _setPaymentHistory(WithdrawHistory.fromJson(json.decode(data.body)));
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

    return withdrawHistory;
  }

  Future<NotificationsModel?> getNotification() async {
    _waitingState(true);
    await PaymnetApi().getNotifications().then((data) {
      print("STATUS CODE => " + data.statusCode.toString());
      print("getNotification DATA => " + data.body.toString());

      if (data.statusCode == 200) {
        _setNotifications(NotificationsModel.fromJson(json.decode(data.body)));
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

    return notificationsModel;
  }

  _setPaymentOffers(value) {
    paymentOffers = value;
    print("Message = " + paymentOffers.message.toString());
    notifyListeners();
  }

  _setPaymentHistory(value) {
    withdrawHistory = value;
    print("Message = " + withdrawHistory.message.toString());
    notifyListeners();
  }

  _setNotifications(value) {
    notificationsModel = value;
    print("Message = " + notificationsModel.message.toString());
    notifyListeners();
  }

  _waitingState(value) {
    wait = value;
    // notifyListeners();
  }
}
