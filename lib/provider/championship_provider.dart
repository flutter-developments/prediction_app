import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prediction_app/model/response_model/champian_ship_byID.dart';
import 'package:prediction_app/model/response_model/predect_question.dart';
import 'package:prediction_app/model/response_model/get_championship.dart';
import 'package:prediction_app/request/championship.dart';
import 'package:prediction_app/utils/images.dart';

class ChampionShipProvider with ChangeNotifier {
  late bool action, wait = false;
  late ChampionshipModel championshipModel;
  ChampionshipById? championshipByIdModel;
  GameDetailesModel? gamedetaile;

  Future<ChampionshipModel> championshipProvider() async {
    _waitingStata(true);
    await ChampioshipApi().requestChampionshipList().then((data) {
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

  //GetGamesByChampianShipid
  Future<ChampionshipById?> getGamesByChampionshipID() async {
    _waitingStata(true);
    await ChampioshipApi().requestgetGamesByChampionshipID().then((data) {
      print("STATUS CODE getGamesByChampionshipID => " +
          data.statusCode.toString());
      print("DATA => " + data.body.toString());
      if (data.statusCode == 200) {
        _champianShipModel(ChampionshipById.fromJson(json.decode(data.body)));
      } else if (data.statusCode == 404) {
        //perform functionality
        showMessageError(data.statusCode);
      } else if (data.statusCode == 403) {
        //perform functionality

        showMessageError(data.statusCode.toString());
      } else {
        //perform functionality

        Map<String, dynamic> result = json.decode(data.body);
        print("Errors = " + result.toString());
        showMessageError(data.statusCode);
      }
    });

    return championshipByIdModel;
  }

  //get Game Details By ID
  Future<GameDetailesModel?> getGameDetailsByID() async {
    _waitingStata(true);
    await ChampioshipApi().requestGameDetailesByID().then((data) {
      print("STATUS CODE getGameDetailsByID => " +
          data.statusCode.toString().toUpperCase());
      print("DATA => " + data.body.toString());
      if (data.statusCode == 200) {
        _getGameDetailes(GameDetailesModel.fromJson(json.decode(data.body)));
      } else if (data.statusCode == 404) {
        //perform functionality
        showMessageError(data.statusCode);
      } else if (data.statusCode == 403) {
        //perform functionality

        showMessageError(data.statusCode.toString());
      } else {
        //perform functionality

        Map<String, dynamic> result = json.decode(data.body);
        print("Errors = " + result.toString());
        showMessageError(data.statusCode);
      }
    });

    return gamedetaile;
  }

  _setUserData(value) {
    championshipModel = value;
    showMessageSuccess("Message = " + championshipModel.message.toString());
    notifyListeners();
  }

  _champianShipModel(value) {
    championshipByIdModel = value;
    showMessageSuccess(
        "Message = " + championshipByIdModel!.message.toString());
    notifyListeners();
  }

  _getGameDetailes(value) {
    gamedetaile = value;
    showMessageSuccess("Message = " + gamedetaile!.message.toString());
    notifyListeners();
  }

  _waitingStata(value) {
    wait = value;
    // notifyListeners();
  }
}
