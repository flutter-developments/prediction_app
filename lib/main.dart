import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/ui/home/exchange_history.dart';
import 'package:prediction_app/ui/home/main_screen.dart';
import 'package:prediction_app/ui/home/main_screen_2.dart';
import 'package:prediction_app/ui/home/premium_upgrade.dart';
import 'package:prediction_app/ui/user_guide/user_guide_4.dart';
import 'package:prediction_app/ui/welcome/welcome.dart';

void main() => runApp(MyApp());
void configLoading() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () =>
          MaterialApp(debugShowCheckedModeBanner: false, home: Welcome()),
      designSize: Size(414, 896),
    );
  }
}
