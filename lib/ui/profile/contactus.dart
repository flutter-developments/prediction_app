import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/provider/user_provider.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/images.dart';
import 'package:provider/provider.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool isFetched = true;

  // ignore: unused_field
  TextEditingController _emailController = TextEditingController();
  // ignore: unused_field
  TextEditingController _nameController = TextEditingController();
  // ignore: unused_field
  TextEditingController _phoneController = TextEditingController();
  // ignore: unused_field
  TextEditingController _commentController = TextEditingController();
  // ignore: unused_field
  TextEditingController _attachmentController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = _formKey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  contactUs() {
    if (validateAndSave()) {
      Provider.of<UserProvider>(context, listen: false)
          .contactUs(
              _nameController.text,
              _emailController.text,
              _phoneController.text,
              _attachmentController.text,
              _commentController.text)
          .then((value) {
        _updateState(true);
        _clearFields();
      });
    } else {
      _updateState(true);
      print("Erroor");
    }
  }

  // ignore: unused_element
  _updateState(bool isValue) {
    setState(() => isFetched = isValue);
  }

  void _clearFields() {
    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _commentController.clear();
    _attachmentController.clear();
  }

  _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() => _attachmentController.text = photo!.path.toString());
  }

  _imgFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() => _attachmentController.text = image!.path.toString());
  }

  @override
  Widget build(BuildContext context) {
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      TextFields.normalTextField(context,
                          controller: _nameController,
                          hintText: "Your Name",
                          emptyValidationMessage: "Please Enter Correct Name"),
                      SizedBox(height: 25.h),
                      TextFields.emailTextField(context,
                          controller: _emailController,
                          hintText: "Email Address",
                          emptyValidationMessage: "Please Enter Correct Email"),
                      SizedBox(height: 25.h),
                      TextFields.normalTextField(context,
                          controller: _phoneController,
                          hintText: "Your Phone",
                          emptyValidationMessage: "Please Enter Correct Phone"),
                      SizedBox(height: 25.h),
                      TextFields.normalTextField(context,
                          enable: false,
                          hintText: "Attachment",
                          controller: _attachmentController,
                          emptyValidationMessage: "Please select image",
                          suffixdata: GestureDetector(
                            onTap: () => _showPicker(context),
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
                      TextFields.normalTextField(context,
                          controller: _commentController,
                          hintText: "Comments",
                          emptyValidationMessage: "Please enter Suggestion",
                          lines: 10),
                      SizedBox(height: 25.h),
                      isFetched
                          ? GradientButton(
                              title: "Send",
                              onPressed: () {
                                _updateState(false);
                                contactUs();
                              },
                            )
                          : Container(child: CircularProgressIndicator())
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
