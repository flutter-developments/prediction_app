import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/app_drawer.dart';
import 'package:prediction_app/Widgets/guide_container.dart';
import 'package:prediction_app/Widgets/textField.dart';
import 'package:prediction_app/database/data/home_screen_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/model/response_model/get_championship.dart';
import 'package:prediction_app/provider/championship_provider.dart';
import 'package:prediction_app/ui/home/event_screen.dart';
import 'package:prediction_app/ui/payment/payment.dart';
import 'package:prediction_app/ui/user_guide/user_guide2.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:provider/provider.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    //late File galleryFile;
    String textAttached = "Attachment";
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.background_color,
      body: SafeArea(
          child: ListView(
        children: [
          appBarWithText(MediaQuery.of(context).size, context, "Contact Us",
              AppColors.background_color, () {
            Navigator.of(context).pop();
          }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Container(
              height: height * 0.8,
              width: width,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
                color: AppColors.background_color1,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    TextFields.emailTextField(context, hintText: "Your Name"),
                    SizedBox(height: 25.h),
                    TextFields.emailTextField(context, hintText: "Your email"),
                    SizedBox(height: 25.h),
                    TextFields.emailTextField(context, hintText: "Your phone"),
                    SizedBox(height: 25.h),
                    TextFields.emailTextField(context,
                        hintText: "Attachment",
                        suffixdata: GestureDetector(
                          onTap: () async {
                            final gallery = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (gallery != null) {
                              setState(() {
                                // galleryFile = File(gallery.path);
                                // textAttached = galleryFile.path.toString();
                              });
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: Container(
                              width: 150.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0)),
                                color: AppColors.background_color1,
                              ),
                              child: Center(
                                child: Text(
                                  "Upload File",
                                  style: titlegreyStyle,
                                ),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 25.h),
                    TextFields.emailTextField(context,
                        hintText: "Comments", lines: 10),
                    SizedBox(height: 25.h),
                    GradientButton(
                      title: "Send",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
