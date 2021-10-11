import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prediction_app/model/response_model/get_championship.dart';
import 'package:prediction_app/request/championship.dart';
import 'package:prediction_app/utils/images.dart';

class ChampionShipProvider with ChangeNotifier {
  late bool action, wait = false;
  // ignore: unused_field
  late ChampionshipModel championshipModel;

  Future<ChampionshipModel> championshipProvider() async {
    _waitingStata(true);
    await ChampioshipApi().getChampionshipList().then((data) {
      print("STATUS CODE Champian => " + data.statusCode.toString());
      print("DATA => " + data.body.toString());
      if (data.statusCode == 200) {
        _setUserData(ChampionshipModel.fromJson(json.decode(data.body)));
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

    return championshipModel;
  }

  //CREATE LOGIN REQUEST
  // ignore: non_constant_identifier_names

  _setUserData(value) {
    championshipModel = value;
    print("Message = " + championshipModel.message.toString());
    notifyListeners();
  }

  // _setLoginUser(value) {
  //   loginmodel = value;
  //   print("Login Message = " + loginmodel.message.toString().toUpperCase());
  //   notifyListeners();
  // }

  _waitingStata(value) {
    wait = value;
    notifyListeners();
  }
}
