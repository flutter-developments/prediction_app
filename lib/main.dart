import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/ui/auth/login.dart';
import 'package:prediction_app/ui/home/event_screen.dart';
import 'package:prediction_app/ui/home/exchange_history.dart';
import 'package:prediction_app/ui/home/exchange_screen1.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/ui/home/open_prediction_screen.dart';
import 'package:prediction_app/ui/home/prediction_screen.dart';
import 'package:prediction_app/ui/home/premium_upgrade.dart';

void main() => runApp(MyApp());
void configLoading() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
          debugShowCheckedModeBanner: false, home: ExchangeHistory()),
      designSize: Size(414, 896),
    );
  }
}
