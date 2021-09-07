// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'model/user.dart';
// import 'provider/chat_provider.dart';
// import 'provider/live_add_provider.dart';
// import 'provider/reviews_provider.dart';

// // String role;

// @Deprecated(
//   "using a global variable called res was a very ****ty bad code idea, now we have UserProvider, please use that instead",
// )
// User? res;
// late Box<dynamic> boxUser;
// late Box<dynamic> langBox;

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
//   Hive.init(appDocumentDir.path);
//   Hive.registerAdapter(UserAdapter());
//   Hive.registerAdapter(CompanyAdapter());
//   Hive.registerAdapter(AdAdapter());
//   Hive.registerAdapter(ProductAdapter());
//   Hive.registerAdapter(ServiceAdapter());
//   Hive.registerAdapter(StripeDataAdapter());

//   boxUser = await Hive.openBox("user");
//   langBox = await Hive.openBox("locale");
//   // print(langBox.get('default'));
//   AppLanguage appLanguage = AppLanguage();
//   await appLanguage.fetchLocale();
//   print("Length  = = " + boxUser.length.toString());

//   if (boxUser.length != 0) res = boxUser.get('default');

//   print(res);

//   HttpOverrides.global = new MyHttpOverrides();

//   APISocketsClient.startListeningToEvents();
//   runApp(MyApp(appLanguage));
// }

// class MyApp extends StatefulWidget {
//   final AppLanguage appLanguage;
//   MyApp(this.appLanguage);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final GlobalKey<NavigatorState> navigatorKey =
//       new GlobalKey<NavigatorState>();

//   @override
//   void initState() {
//     super.initState();
//     InactivityTimer.instance.initialize(
//       timeout: INACTIVITY_TIMEOUT,
//       onTimeout: _logout,
//     );
//   }

//   void _logout() {
//     if (res?.role != null) {
//       // TODO: show dialog instead of a crash-logout
//       // Logout if not already logged out.
//       UserProvider().clearUserBox();
//       AppRoutes.replace(navigatorKey.currentContext!, LoginPage());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => UserProvider()),
//         ChangeNotifierProvider(create: (_) => CompanyProvider()),
//         ChangeNotifierProvider(create: (_) => CategoryProvider()),
//         ChangeNotifierProvider(create: (_) => AdsProvider()),
//         ChangeNotifierProvider(create: (_) => LiveAdd()),
//         ChangeNotifierProvider(create: (_) => ChatProvider()),
//         ChangeNotifierProvider(create: (_) => JobsProvider()),
//         ChangeNotifierProvider(create: (_) => ReviewsProvider()),
//         ChangeNotifierProvider(create: (_) => LocationsProvider()),
//         ChangeNotifierProvider(create: (_) => AppLanguage()),
//         ChangeNotifierProvider(create: (_) => ScreenHeight()),
//       ],
//       child: ChangeNotifierProvider<AppLanguage>(
//         create: (_) => widget.appLanguage,
//         child: Consumer<AppLanguage>(builder: (context, model, child) {
//           print('the language is a below');
//           print(model.appLocal);
//           return GestureDetector(
//             /// This GestureDetector is for detecting inactivty and
//             /// logging out user after a certain time of inactivity
//             behavior: HitTestBehavior.translucent,
//             onTap: () => InactivityTimer.instance.resetTimer(),
//             onTapDown: (_) => InactivityTimer.instance.resetTimer(),
//             child: MaterialApp(
//               theme: AppTheme.lightTheme,
//               navigatorKey: navigatorKey,
//               debugShowCheckedModeBanner: false, //home: CompanyProfile()
//               supportedLocales: [
//                 Locale('en', 'US'),
//                 Locale('fr', 'FR'),
//               ],
//               locale: model.appLocal,
//               localizationsDelegates: [
//                 AppLocalizations.delegate,
//                 GlobalMaterialLocalizations.delegate,
//                 GlobalWidgetsLocalizations.delegate,
//                 GlobalCupertinoLocalizations.delegate,
//               ],
//               home: FutureBuilder(
//                 future: Hive.openBox("user"),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     print(snapshot.data.toString());
//                     if (snapshot.hasError)
//                       return Text(snapshot.error.toString());
//                     else
//                       return SplashScreen();
//                   } else
//                     return Scaffold();
//                 },
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     Hive.close();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
