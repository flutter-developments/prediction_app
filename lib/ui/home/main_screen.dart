import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/app_drawer.dart';
import 'package:prediction_app/database/data/home_screen_data.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/routes.dart';

import 'exchange_history.dart';
import 'notification.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _key,
      drawer: DrawerFull(context, MediaQuery.of(context).size),
      // appBar: AppBar(
      //   title: Text("title"),
      // ),
      body: Container(
          child: Column(
        children: [
          buildContainer(size, context),
          buildSuper_leauge(size),
        ],
      )),
    );
  }

  Container buildContainer(Size size, BuildContext context) {
    return Container(
      height: size.height * .136,
      width: size.width,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              offset: Offset(7.0, 7.0),
              blurRadius: 40.0,
            ),
          ],
          color: AppColors.primery_color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () => _key.currentState!.openDrawer(),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(50)),
                    // child: Image.asset("assets/images/pic 2.png"),
                  ),
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                Icon(
                  Icons.arrow_back,
                  size: 18,
                  color: Colors.white,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      "1000",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Image.asset("assets/images/doller.png")
                  ],
                ),
                Row(
                  children: [
                    Image.asset("assets/images/Ellipse 2.png"),
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Text(
                      "Get Credit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      AppRoutes.push(context, Notifications());
                    },
                    child:
                        Image.asset("assets/images/appbar_notification.png")),
                GestureDetector(
                    onTap: () {
                      AppRoutes.push(context, ExchangeHistory());
                    },
                    child: Image.asset("assets/images/doller_appbar.png"))
              ],
            )
          ],
        ),
      )),
    );
  }

  // ignore: non_constant_identifier_names
  Container buildSuper_leauge(Size size) {
    return Container(
      height: size.height * .85,
      width: size.width,
      child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 2),
              child: Card(
                child: Container(
                  height: size.height * .25,
                  width: size.width * .491,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(notifications[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ClipRect(
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50.0,
                        right: 69.0,
                        left: 69.0,
                        child: Text(
                          notifications[index].title,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 90.0,
                        right: 69.0,
                        left: 69.0,
                        child: Text(
                          notifications[index].time.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
