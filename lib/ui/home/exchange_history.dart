import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';

class ExchangeHistory extends StatefulWidget {
  @override
  _ExchangeHistoryState createState() => _ExchangeHistoryState();
}

class _ExchangeHistoryState extends State<ExchangeHistory> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: AppColors.background_color,
          child: Column(
            children: [
              buildApp_only_title_bar(size, context, "Exchange History",
                  AppColors.background_color1),
              build_playstore(size),
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names
  build_playstore(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * .87,
        width: size.width,
        child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primery_color),
                  height: size.height * .164,
                  width: size.width * .491,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              color: AppColors.bar_color),
                          child: Image.asset(
                            "assets/images/playstore.png",
                            scale: 1.5,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Color(0xFF242A3E),
                          ),
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Google Play Exchange",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "10:32 - Aug 12, 2021",
                                style: subtitleStyle,
                              ),
                              
                              Row(
                                children: [
                                  Text(
                                    "Credits Used",
                                    style: subtitleStyle,
                                  ),
                                  Text(
                                    "- 48.32",
                                    style: subtitleStyle,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Withdrawal",
                                    style: subtitleStyle,
                                  ),
                                  Text(
                                    "- \$ 20",
                                    style: subtitleStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
