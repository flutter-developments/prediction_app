import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/textField.dart';
import 'package:prediction_app/database/Cache.dart';
import 'package:prediction_app/model/post_model/login_model.dart';
import 'package:prediction_app/provider/register_provider.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/images.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:prediction_app/ui/welcome/welcome.dart';
import 'package:provider/provider.dart';

class Auth extends StatefulWidget {
  final bool isSignup;
  const Auth({Key? key, required this.isSignup}) : super(key: key);
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  final _formLoginKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  late LOGINMODEL login_model;
  // ignore: unused_field
  late RegisterProvider _registerProvider;
  // ignore: unused_field
  TextEditingController _emailController = TextEditingController();
  // ignore: unused_field
  TextEditingController _nameController = TextEditingController();
  // ignore: unused_field
  TextEditingController _passwordController = TextEditingController();
  // ignore: unused_field
  TextEditingController _conformPasswordController = TextEditingController();

  bool isSignup = true;
  void initState() {
    super.initState();
    isSignup = widget.isSignup;
  }

  ///Sign In Request
  // ignore: unused_element
  _validateAndSubmitSignIn(context) {
    if (validateAndSaveLogin()) {
      print(_emailController.text);
      print(_passwordController.text);
      Provider.of<RegisterProvider>(context, listen: false)
          .login_response(_emailController.text, _passwordController.text)
          .then((value) {
        if (value.success == true) {
          showMessageSuccess(value.message.toString().toUpperCase());
          AppRoutes.push(context, Welcome());
          _clearFields();
        } else {
          showMessageError(value.message.toString().toUpperCase());
        }
      });
    } else {
      print("Please fill all filds".toUpperCase());
    }
  }

//Register

  _validateAndSubmitSignup(context) {
    print(_emailController.text.toUpperCase());
    if (validateAndSave()) {
      Provider.of<RegisterProvider>(context, listen: false)
          .registerResponse(_nameController.text, _emailController.text,
              _passwordController.text, _conformPasswordController.text)
          .then((value) {
        if (value.success == true) {
          showMessageSuccess(value.message.toString().toUpperCase());
          _clearFields();
        } else {
          showMessageError(value.message.toString().toUpperCase());
        }
      });
    } else {
      print("Please fill all filds".toUpperCase());
    }
  }

  _clearFields() {
    _nameController.text = "";
    _emailController.text = "";
    _passwordController.text = "";
    _conformPasswordController.text = "";
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  bool validateAndSaveLogin() {
    final form = _formLoginKey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _registerProvider = Provider.of<RegisterProvider>(context);
    return Scaffold(
      body: Container(
          color: AppColors.background_color,
          child: ListView(
            children: [
              Container(
                height: size.height * .22,
                width: size.width,
                decoration: BoxDecoration(color: AppColors.primery_color),
                child: Center(
                  child: Container(
                    height: 130.h,
                    width: size.width * 0.50,
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Container(
                  color: AppColors.bar_color, child: buildTransection(size)),
              isSignup == true
                  ? Column(
                      children: [
                        Container(
                          height: size.height * .55,
                          width: size.width,
                          decoration: BoxDecoration(color: AppColors.bar_color),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35.w),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFields.emailTextField(context,
                                      controller: _emailController,
                                      hintText: "Email Address",
                                      icon: Icons.email,
                                      emptyValidationMessage:
                                          "Please Enter Correct Email"),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  TextFields.normalTextField(context,
                                      controller: _nameController,
                                      color: Colors.white,
                                      hintText: "Name",
                                      icon: Icons.person,
                                      emptyValidationMessage:
                                          "Name Can't be Emipty"),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  TextFields.passwordTextField(
                                    context,
                                    controller: _passwordController,
                                    hintText: "Password",
                                    icon: Icons.vpn_key,
                                    validator: (value) {
                                      return (value!.length < 9)
                                          ? "Password Length must be greater then 9"
                                          : null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  TextFields.passwordTextField(
                                    context,
                                    controller: _conformPasswordController,
                                    hintText: "Confirm Password",
                                    icon: Icons.vpn_key,
                                    validator: (value) {
                                      if (value!.length < 9)
                                        return 'Confirm Length must be greater then 9';
                                      if (value != _passwordController.text)
                                        return 'Password Not Match With Conform Password ';
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "OR Sign Up With",
                                    style: GoogleFonts.raleway(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.whiteColor),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                          child: Image.asset(
                                        "assets/images/google.png",
                                        height: 60.h,
                                      )),
                                      GestureDetector(
                                          child: Image.asset(
                                        "assets/images/fb.png",
                                        height: 60.h,
                                      ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Already have an account ?",
                                        style: GoogleFonts.raleway(
                                            fontSize: 14.sp,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isSignup = false;
                                            });
                                          },
                                          child: Text("Sign In",
                                              style: GoogleFonts.raleway(
                                                  fontSize: 14.sp,
                                                  color:
                                                      AppColors.gradiantColor1,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        RaisedGradientButton(
                            width: 150.w,
                            height: 50.h,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 16.sp, color: AppColors.whiteColor),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0XFFDD7EE0).withOpacity(0.9),
                                Color(0XFF8787F2),
                              ],
                            ),
                            onPressed: () {
                              //EasyLoading.show(status: 'loading...');
                              _validateAndSubmitSignup(context);
                              // AppRoutes.push(context, Welcome());
                            }),
                        SizedBox(
                          height: 40.h,
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          height: size.height * .50,
                          width: size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                              ),
                              color: AppColors.bar_color),
                          child: Form(
                            key: _formLoginKey,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35.w),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  TextFields.emailTextField(context,
                                      controller: _emailController,
                                      hintText: "Email Address",
                                      icon: Icons.email,
                                      emptyValidationMessage:
                                          "Please Enter Correct Email"),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFields.passwordTextField(
                                    context,
                                    controller: _passwordController,
                                    hintText: "Password",
                                    icon: Icons.vpn_key,
                                    validator: (value) {
                                      return (value!.length < 9)
                                          ? "Password Length must be greater then 9"
                                          : null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text("OR Sign In With",
                                      style: GoogleFonts.raleway(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.whiteColor)),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                          child: Image.asset(
                                        "assets/images/google.png",
                                        height: 60.h,
                                      )),
                                      GestureDetector(
                                          child: Image.asset(
                                              "assets/images/fb.png",
                                              height: 60.h))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have an account ?",
                                        style: smallwhiteStyle,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isSignup = true;
                                              _clearFields();
                                            });
                                          },
                                          child: Text("Sign Up",
                                              style: GoogleFonts.raleway(
                                                  fontSize: 14.sp,
                                                  color:
                                                      AppColors.gradiantColor1,
                                                  fontWeight:
                                                      FontWeight.w700))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        RaisedGradientButton(
                            width: 140.w,
                            height: 50.h,
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 16.sp, color: AppColors.whiteColor),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0XFFDD7EE0).withOpacity(0.9),
                                Color(0XFF8787F2),
                              ],
                            ),
                            onPressed: () {
                              _validateAndSubmitSignIn(context);
                              // AppRoutes.push(context, Welcome());
                            }),
                        SizedBox(
                          height: 40.h,
                        )
                      ],
                    )
            ],
          )),
    );
  }

  Container buildTransection(Size size) {
    return Container(
      height: size.height * .06,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.9],
          colors: [AppColors.background_color, AppColors.bar_color],
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isSignup = true;
                _clearFields();
              });
            },
            child: Container(
              height: size.height * .06,
              width: size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: isSignup == true
                      ? BorderRadius.only(
                          topRight: Radius.circular(10.0),
                        )
                      : BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                        ),
                  color: isSignup == true
                      ? AppColors.bar_color
                      : AppColors.background_color),
              child: Center(
                child: Text(
                  "Sign Up",
                  style:
                      TextStyle(fontSize: 18.sp, color: AppColors.whiteColor),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isSignup = false;
                _clearFields();
              });
            },
            child: Container(
              height: size.height * .06,
              width: size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: isSignup == false
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                        )
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                        ),
                  color: isSignup == false
                      ? AppColors.bar_color
                      : AppColors.background_color),
              child: Center(
                child: Text(
                  "Sign In",
                  style:
                      TextStyle(fontSize: 18.sp, color: AppColors.whiteColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // ignore: unused_element
  void _addToLocalDB() {
    print("We e oin ");
    try {
      print("Add check");
      setState(() {
        Cache.loginmodel = login_model;
        print(Cache.loginmodel!.message.toString());
      });
      // userBox = UserBox(
      //   email: Cache.loginmodel.data.,
      //   name: CacheData.users.name,
      //   surname: CacheData.users.surname,
      //   userid: CacheData.users.id,
      //   userpin: CacheData.users.userPin,
      //   phonenumber: CacheData.users.phoneNumber,
      //   token: loginSignUpUserModel.signUp!.token.toString(),
      // );
      // print("---Email before save---->" + userBox.email.toString());
      // print(userBox);
      // boxUser!.add(userBox);
      // print('this is the box length' + boxUser!.length.toString());
      // res = boxUser!.get(0) as UserBox;
      // showMessageSuccess("Successful");
      // AppRoutes.makeFirst(context, Inbox());
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
