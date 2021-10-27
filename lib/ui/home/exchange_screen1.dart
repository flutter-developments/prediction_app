import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/database/Cache.dart';
import 'package:prediction_app/model/response_model/paymentModel.dart';
import 'package:prediction_app/provider/paymnet_provider.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/ui/home/withdraw_email.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:provider/provider.dart';

class ExchangeScreen1 extends StatefulWidget {
  @override
  _ExchangeScreen1State createState() => _ExchangeScreen1State();
}

class _ExchangeScreen1State extends State<ExchangeScreen1> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  PaymentOffers? paymentOffers;
  bool isSearchPayment = false;

  @override
  void initState() {
    super.initState();
    _getPaymentOffers();
  }

  _getPaymentOffers() {
    Provider.of<PaymnetProvider>(context, listen: false)
        .paymnetOffersStatus()
        .then((value) {
      print(value!.message.toString());
      if (value.success == true) {
        _updateState(true);
        setState(() {
          paymentOffers = value;
          Cache.logopath = paymentOffers!.data.logopath.toString();
          print(paymentOffers!.data.paymentMethods.length);
        });
      }
    });
  }

  // ignore: unused_element
  _updateState(bool isValue) {
    isSearchPayment = isValue;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PaymnetProvider paymnetProvider =
        Provider.of<PaymnetProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: AppColors.background_color,
            child: ListView(
              children: [
                buildappbarContainer(size, context),
                SizedBox(
                  height: 50.h,
                ),
                isSearchPayment
                    ? Container(
                        child: new GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        controller:
                            new ScrollController(keepScrollOffset: false),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: paymentOffers!.data.paymentMethods
                            .map((PaymentMethod value) {
                          return new Container(
                              //  height: size.height*.3,
                              child: buildColumn(size, value));
                        }).toList(),
                      ))
                    : Center(child: CircularProgressIndicator()),
              ],
            )),
      ),
    );
  }

  Column buildColumn(Size size, PaymentMethod paymentMethod) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: size.height * 0.20,
          width: size.width * 0.40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.background_color1,
          ),
          child: Center(
              child: Image.network(
                  paymentOffers!.data.logopath + "/" + paymentMethod.logo)),
        ),
        SizedBox(
          height: 10.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(paymentMethod.name,
              textAlign: TextAlign.start,
              style: GoogleFonts.openSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white)),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "\u0024 ${paymentMethod.exchangeRate} ",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.goldenColor),
        ),
        SizedBox(height: 10.h),
        RaisedGradientButton(
            width: 120.w,
            height: 45.h,
            child: Text(
              "Exchange",
              style: subtitleStyle,
            ),
            gradient: LinearGradient(
              colors: [
                Color(0XFFDD7EE0).withOpacity(0.9),
                Color(0XFF8787F2).withOpacity(0.9),
              ],
            ),
            onPressed: () {
              AppRoutes.push(
                  context,
                  WithDrawEmail(
                    selectedPyamentMethod: paymentMethod,
                  ));
            }),
      ],
    );
  }

  //appbar
  Container buildappbarContainer(Size size, BuildContext context) {
    return Container(
      height: size.height * .150,
      width: size.width,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              spreadRadius: 10,
              offset: Offset(7.0, 7.0),
              blurRadius: 10.0,
              color: AppColors.background_color1,
            ),
          ],
          color: AppColors.primery_color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _key.currentState!.openDrawer(),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/pic 2.png",
                        scale: 1.5,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: size.width * 0.05),
                      Text(
                        "1000",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: size.width * .01,
                      ),
                      Container(
                        height: 20.h,
                        width: 20.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.goldenColor)),
                        child: Image.asset("assets/images/colon.png"),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        AppRoutes.push(context, Notifications());
                      },
                      icon: Icon(
                        Icons.notification_add_outlined,
                        color: AppColors.white,
                        size: 35.sp,
                      ))
                ],
              ),
            ),
            //second row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        //  AppRoutes.push(context, HomeScreen());
                      },
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        iconSize: 20.sp,
                        onPressed: () {
                          AppRoutes.pop(context);
                        },
                      )),
                  Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 17,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xFFDD7EE0),
                                Color(0xFF8787F2),
                                Color(0xFFDD7EE0),
                              ],
                            ),
                          ),
                          child: IconButton(
                              alignment: Alignment.topCenter,
                              iconSize: 19.sp,
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: AppColors.white,
                              )),
                        ),
                      ),
                      //Image.asset("assets/images/icon1.png"),
                      SizedBox(
                        width: size.width * .02,
                      ),
                      Text(
                        "Get Credit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: CircleAvatar(
                      backgroundColor: AppColors.goldenColor,
                      maxRadius: 17.sp,
                      child: IconButton(
                          alignment: Alignment.topCenter,
                          iconSize: 20.sp,
                          onPressed: () {
                            AppRoutes.push(context, ExchangeScreen1());
                          },
                          icon: Icon(
                            Icons.attach_money,
                            color: AppColors.white,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
