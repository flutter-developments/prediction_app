import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  late bool action, wait = false;
  var jResult;
  // ignore: unused_field
  // late REGISTERMODEL _registermodel;

  //CREATE REGISTER REQUEST
  // Future<REGISTERMODEL> registerResponse(
  //     name, email, password, cpassword) async {
  //   waiting(true);
  //  // await RegisterApi(name, email, password, cpassword)
  //    ///   .createUser()
  //     //  .then((data) {
  //     print("STATUS CODE" + data.statusCode.toString());
  //     print("DATA  " + data.body.toString());
  //     if (data.statusCode == 201) {
  //       jResult = json.decode(data.body);
  //      // setUserData(REGISTERMODEL.fromJson(jResult));
  //     } else if (data.statusCode == 404) {
  //       showMessage(data.statusCode);
  //     } else if (data.statusCode == 403) {
  //       showMessage("User Already Exist");
  //     } else {
  //       Map<String, dynamic> result = json.decode(data.body);
  //       print("Errors = " + result.toString());
  //       showMessage(data.statusCode);
  //     }
  // //  });

  //   return _registermodel;
  // }

  //CREATE REGISTER REQUEST
  // ignore: non_constant_identifier_names
  // Future<REGISTERMODEL> login_response(name, email, password, cpassword) async {
  //   waiting(true);
  //   await RegisterApi(name, email, password, cpassword)
  //       .createUser()
  //       .then((data) {
  //     print("STATUS CODE" + data.statusCode.toString());
  //     print("DATA  " + data.body.toString());
  //     if (data.statusCode == 201) {
  //       jResult = json.decode(data.body);
  //     //  setUserData(REGISTERMODEL.fromJson(jResult));
  //     } else if (data.statusCode == 404) {
  //       showMessage(data.statusCode);
  //     } else if (data.statusCode == 403) {
  //       showMessage("User Already Exist");
  //     } else {
  //       Map<String, dynamic> result = json.decode(data.body);
  //       print("Errors = " + result.toString());
  //       showMessage(data.statusCode);
  //     }
  //   });

  //  return _registermodel;
  //}

  // void setUserData(value) {
  //   _registermodel = value;
  //   print("Message Updated = " + _registermodel.message.toString());
  //   notifyListeners();
  // }

  void waiting(value) {
    wait = value;
    notifyListeners();
  }

  void showMessage(msg) {
    // Fluttertoast.showToast(
    //     msg: msg,
    //     textColor: AppColors.greyColor,
    //     backgroundColor: Colors.white);
  }
}
