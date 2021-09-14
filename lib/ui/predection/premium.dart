import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/utils/app_colors.dart';

class PremiumUpgrade extends StatefulWidget {
  @override
  _PremiumUpgradeState createState() => _PremiumUpgradeState();
}

class _PremiumUpgradeState extends State<PremiumUpgrade> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: AppColors.background_color,
          child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           //   buildApp_only_title_bar(size, context, "Upgrade"),
             // SizedBox(height: 20),
              Text(
                "Upgrade To",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Text("Premium",
                  style: TextStyle(
                      color: AppColors.gradiantColor1,
                      fontSize: 22,
                      fontWeight: FontWeight.w900)),
                      Container(
                         decoration: BoxDecoration(
          color: AppColors.bar_color,
          borderRadius: BorderRadius.circular(10),
        ),
                        height: size.height*.2,
                        width: size.width*.4,
             
                        child:Image.asset("assets/images/Vector.png",scale: 1.2,),
                      ),
              build_notifications(size),
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names
  build_notifications(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bar_color,
          borderRadius: BorderRadius.circular(10),
        ),
        height: size.height * .35,
        width: size.width,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 2, left: 8),
                child: Container(
                  height: size.height * .055,
                  width: size.width * .491,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          "assets/images/true.png",
                          scale: 1,
                        ),
                      ),
                      Text(
                        "Premium Benefit  $index",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
