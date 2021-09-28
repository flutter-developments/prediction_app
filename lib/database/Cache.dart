import 'package:prediction_app/model/post_model/login_model.dart';

class Cache {
  // ignore: unused_field
  static LOGINMODEL? loginmodel;
  static bool? flowFromLoginsignUp = false;
  static String email = "";
  static String name = "";
  static String surName = "";
  static String userEmail = "";
  static String userDOB = "";
  static String userGender = "";
  static String userGenderID = "";
  static String phone = "0123456789";
  static String avaters = "";
  static DateTime dob = DateTime.now();
  static bool isNative = true;
  static String country = "";
  static String city = "";
  static String senderUser = "";
  static double startAgeRange = -1;
  static double endAgeRange = -1;
  static String selectedGenderMatchProfile = "";
  static String selectedGenderMatchName = "";
  static bool nativeMatch = false;
  static bool countryMatch = false;
}
