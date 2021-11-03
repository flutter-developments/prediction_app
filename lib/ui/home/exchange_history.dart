import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/model/response_model/withdraw_history.dart';
import 'package:prediction_app/provider/paymnet_provider.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ExchangeHistory extends StatefulWidget {
  @override
  _ExchangeHistoryState createState() => _ExchangeHistoryState();
}

class _ExchangeHistoryState extends State<ExchangeHistory> {
  WithdrawHistory? history;
  bool isrecieved = false;
  @override
  void initState() {
    super.initState();
    _getPaymentOffers();
  }

  _getPaymentOffers() {
    Provider.of<PaymnetProvider>(context, listen: false)
        .withdrawPaymentHistory()
        .then((value) {
      print(value!.message.toString());
      if (value.success == true) {
        setState(() {
          history = value;
          _updateState(true);
        });
      }
    });
  }

  _updateState(bool update) {
    setState(() => isrecieved = update);
  }

//   _getItems(){
// return withdrawHistory!.data.history;
//   }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: AppColors.background_color,
            child: ListView(
              children: [
                appBarWithText(
                    size, context, "Exchange History", AppColors.bar_color, () {
                  Navigator.of(context).pop();
                }),
                build_playstore(size),
              ],
            )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  build_playstore(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: isrecieved
          ? Container(
              height: size.height,
              width: size.width,
              child: ListView.builder(
                  itemCount: history!.data.history.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: FlipAnimation(
                        // verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20.0.h,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.background_color1),
                              height: 170.h,
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
                                          color: AppColors.background_color1),
                                      child: Image.network(history!
                                              .data.logopath +
                                          "/" +
                                          history!.data.history[index].logo),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            history!
                                                .data.history[index].methodName,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          // WavyText("Google Play Exchange",
                                          //     Colors.white, 18.sp, FontWeight.w600),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            history!
                                                .data.history[index].createdAt
                                                .toString(),
                                            style: GoogleFonts.openSans(
                                                textStyle: subtitleStyle1),
                                          ),
                                          SizedBox(height: 20.h),
                                          Row(
                                            children: [
                                              Text(
                                                "Credits Used",
                                                style: subtitleStyle,
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                "- ${history!.data.history[index].methodId}",
                                                style: GoogleFonts.openSans(
                                                    textStyle:
                                                        goldensubtitleStyle1),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                "€",
                                                style: GoogleFonts.openSans(
                                                    textStyle:
                                                        goldensubtitleStyle1),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 7.h,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Withdrawal",
                                                style: subtitleStyle,
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                  "  -   ${history!.data.history[index].amount}",
                                                  style: GoogleFonts.openSans(
                                                      textStyle:
                                                          goldensubtitleStyle1)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
