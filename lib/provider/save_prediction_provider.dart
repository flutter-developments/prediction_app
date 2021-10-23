import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:prediction_app/model/post_model/save_prediction_model.dart';
import 'package:prediction_app/request/auth_request.dart';
import 'package:prediction_app/utils/images.dart';

class SavePredictionProvider with ChangeNotifier {
  late bool action, wait = false;
  var _registerResult;
  // ignore: unused_field
  // REGISTERMODEL? _registermodel;
  // LOGINMODEL? loginmodel;
  //CREATE REGISTER REQUEST
  savePredictionData(SavePredictionModel model) async {
    _waitingStata(true);
    await SavePredictionData_APi().saveData(model).then((data) {
      print("STATUS CODE => " + data.statusCode.toString());
      print("DATA => " + data.body.toString());
      if (data.statusCode == 200) {

      } else if (data.statusCode == 404) {
        showMessageError(data.statusCode);
      } else if (data.statusCode == 403) {
        showMessageError("User Already Exist");
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        print("Errors = " + result.toString());
        showMessageError(data.statusCode);
      }
    });

    // return _registermodel;
  }

  _waitingStata(value) {
    wait = value;
    notifyListeners();
  }
}