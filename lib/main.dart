import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/ui/home/exchange_screen1.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/ui/welcome/entry_page.dart';
import 'package:prediction_app/ui/welcome/welcome.dart';


void main() => runApp(MyApp());
void configLoading() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () =>
          MaterialApp(debugShowCheckedModeBanner: false, home: Notifications()),
      designSize: Size(414, 896),
    );
  }
}
