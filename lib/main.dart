import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:prediction_app/provider/championship_provider.dart';
import 'package:prediction_app/provider/paymnet_provider.dart';
import 'package:prediction_app/provider/register_provider.dart';
import 'package:prediction_app/ui/home/exchange_screen1.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:async';
import 'database/hive/hive_initilization.dart';
import 'provider/sports_provider.dart';
import 'ui/language/select_language.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:flutter/foundation.dart';

import 'ui/payment/buy_coin_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform == TargetPlatform.android) {
    InAppPurchaseAndroidPlatformAddition.enablePendingPurchases();
  }
  // ignore: unused_local_variable
  bool _isExist = await HiveInitialization.hiveData();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => SportsProvider()),
        ChangeNotifierProvider(create: (_) => ChampionShipProvider()),
        ChangeNotifierProvider(create: (_) => PaymnetProvider()),
      ],
      child: ScreenUtilInit(
        builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(),
            home: FutureBuilder(
              future: Hive.openBox("user"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError)
                    return Text(snapshot.error.toString());
                  else
                    return ExchangeScreen1();
                } else
                  return Scaffold();
              },
            )),
        designSize: Size(414, 896),
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
