import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:prediction_app/ui/home/exchange_screen1.dart';
import 'package:prediction_app/ui/home/main_screen.dart';
import 'package:prediction_app/ui/home/open_prediction_screen.dart';
import 'package:prediction_app/ui/home/prediction_screen.dart';
import 'package:prediction_app/ui/language/select_language.dart';
import 'package:prediction_app/ui/welcome/entry_page.dart';



void main() => runApp(MyApp());
void configLoading() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
          debugShowCheckedModeBanner: false, home:Language()),
      designSize: Size(414, 896),
    );
  }
}
