import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prediction_app/model/post_model/login_model.dart';
import 'package:prediction_app/model/post_model/register_model.dart';
import 'package:prediction_app/request/auth_request.dart';
import 'package:prediction_app/utils/images.dart';

class RegisterProvider with ChangeNotifier {
  late bool action, wait = false;
  var _registerResult;
  // ignore: unused_field
  RegisterModel? _registermodel;
  LoginModel? loginmodel;
  //CREATE REGISTER REQUEST
  Future<RegisterModel?> registerResponse(
      name, email, password, cpassword) async {
    _waitingStata(true);
    await AuthApi().createUser(name, email, password, cpassword).then((data) {
      print("STATUS CODE => " + data.statusCode.toString());
      print("DATA => " + data.body.toString());
      if (data.statusCode == 200) {
        _registerResult = json.decode(data.body);
        _setUserData(RegisterModel.fromJson(_registerResult));
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

    return _registermodel;
  }

  //CREATE LOGIN REQUEST
  // ignore: non_constant_identifier_names
  Future<LoginModel?> login_response(
    email,
    password,
  ) async {
    _waitingStata(true);
    await AuthApi()
        .loginUser(
      email,
      password,
    )
        .then((data) {
      print("STATUS CODE" + data.statusCode.toString());
      print("DATA  " + data.body.toString().toUpperCase());
      if (data.statusCode == 200) {
        _registerResult = json.decode(data.body);
        _setLoginUser(LoginModel.fromJson(_registerResult));
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

    return loginmodel;
  }

  _setUserData(value) {
    _registermodel = value;
    print("Register Message = " + _registermodel!.message.toString());
    notifyListeners();
  }

  _setLoginUser(value) {
    loginmodel = value;
    print("Login Message = " + loginmodel!.message.toString().toUpperCase());
    notifyListeners();
  }

  _waitingStata(value) {
    wait = value;
    // notifyListeners();
  }
}
