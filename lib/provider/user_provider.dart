import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prediction_app/model/response_model/user_model.dart';
import 'package:prediction_app/request/user_request.dart';
import 'package:prediction_app/utils/images.dart';

class UserProvider with ChangeNotifier {
  late bool action, wait = false;
  late UserProfile userProfile;

  Future<UserProfile?> getProfile() async {
    _waitingState(true);
    await UserApi().getProfile().then((data) {
      print("STATUS CODE => " + data.statusCode.toString());
      print("DATA => " + data.body.toString());

      if (data.statusCode == 200) {
        _setUserProfile(UserProfile.fromJson(json.decode(data.body)));
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

    return userProfile;
  }

  Future contactUs(name, email, phone, image, comment) async {
    await UserApi()
        .contactUsCall(name, email, phone, image, comment)
        .then((data) {
      print("STATUS CODE => " + data.statusCode.toString());
      print("DATA => " + data.body.toString());
      if (data.statusCode == 200) {
        showMessageSuccess(data.body);
      } else if (data.statusCode == 404) {
        showMessageError(data.statusCode);
      } else if (data.statusCode == 403) {
        showMessageError(data.statusCode);
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        print("Errors = " + result.toString());
        showMessageError(data.statusCode);
      }
    });
  }

  _setUserProfile(value) {
    userProfile = value;
    print("Message = " + userProfile.message.toString());
    notifyListeners();
  }

  _waitingState(value) {
    wait = value;
    // notifyListeners();
  }
}
