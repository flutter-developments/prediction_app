import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Images {
  static const String exchnage = 'assets/images/exchange.png';
  static const String home = 'assets/images/home.png';
  static const String prediction = 'assets/images/prediction.png';
  static const String settings = 'assets/images/settings.png';
  static const String withdraw = 'assets/images/withdrew.png';
  static const String userGuide = 'assets/images/userguide.png';
  static const String premium = 'assets/images/premium.png';
  static const String signOut = 'assets/images/logout.png';
  static const String locationOn = 'assets/icons/location-on.png';
  static const String payment = 'assets/icons/payment.png';
  static const String signout = 'assets/icons/signout.png';
  static const String user = 'assets/icons/user.png';
  static const String facebook = 'assets/icons/facebook.png';
  static const String gift = 'assets/icons/gift.png';
  static const String globe = 'assets/icons/globe.png';
  static const String instagram = 'assets/icons/instagram.png';
  static const String location = 'assets/icons/Icon weather-raindrop.png';
  static const String phonecopy = 'assets/icons/phonecopy.png';
  static const String squares = 'assets/icons/squares.png';
  static const String twitter = 'assets/icons/twitter.png';
  static const String wifi = 'assets/icons/wifi.png';
  static const String youtube = 'assets/icons/youtube.png';
  static const String menu = 'assets/icons/menu.png';
  static const String profileback = 'assets/icons/profileback.png';
  static const String send = 'assets/icons/send.png';
  static const String emoji = 'assets/icons/emoji.png';
  static const String abya = 'assets/images/abya.png';
  static const String chart = 'assets/icons/chart.png';
}

// ignore: unused_element
showMessageError(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

// ignore: unused_element
showMessageSuccess(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green[700],
      textColor: Colors.white,
      fontSize: 16.0);
}
