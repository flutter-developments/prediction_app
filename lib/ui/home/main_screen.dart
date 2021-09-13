import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/app_drawer.dart';
import 'package:prediction_app/database/data/home_screen_data.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerFull(context, MediaQuery.of(context).size),
      appBar: AppBar(title: Text("title"),),
      body: Container(
          child: Column(
        children: [
          buildApp_bar(size, context),
          buildSuper_leauge(size),
        ],
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
