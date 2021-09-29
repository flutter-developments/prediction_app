import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:prediction_app/provider/championship_provider.dart';
import 'package:prediction_app/provider/register_provider.dart';
import 'package:prediction_app/ui/home/main_screen_2.dart';
import 'package:prediction_app/ui/language/select_language.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:async';
import 'database/hive/user_box.dart';
import 'provider/sports_provider.dart';
import 'ui/home/main_screen.dart';

UserBox? res;
Box<dynamic>? boxUser;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(UserBoxAdapter());
  boxUser = await Hive.openBox("user");
  print(
      "Accounts exist in local db " + boxUser!.length.toString().toUpperCase());
  if (boxUser!.length == 0) {
    print('Accounts :  0'.toUpperCase());
  } else {
    res = boxUser!.get(0) as UserBox;
  }
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
                    return MainScreen();
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
