import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:girafee/Widgets/button.dart';
import 'package:girafee/Widgets/headerText.dart';
import 'package:girafee/Widgets/textField.dart';
import 'package:girafee/api/api_client.dart';
import 'package:girafee/main.dart';
import 'package:girafee/model/user.dart';
import 'package:girafee/provider/user_provider.dart';
import 'package:girafee/ui/misc/image_picker.dart';
import 'package:girafee/utils/app_colors.dart';
import 'package:girafee/utils/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:string_extensions/string_extensions.dart';

import 'cached_image.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController? _firstNameController, _lastNameController;

  double? width, height;
  int? selectedRadio;
  File? _image;
  bool _isloading = false, edit = true;
  String? imageUrl, honorificValue, email = res!.email;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  User? updateResBox;

  bool validateAndSave() {
    final form = _formKey.currentState!;
    form.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      await ApiClient.usersService.update(
        firstName: _firstNameController!.text,
        lastName: _lastNameController!.text,
        honorific: honorificValue,
        file: _image,
      );

      edit = true;
    }
  }

  @override
  void initState() {
    super.initState();
    honorificValue = res!.honorific;

    selectRadio(res!.honorific);
    _firstNameController = TextEditingController(
      text: res!.firstName!.capitalize(),
    );
    _lastNameController = TextEditingController(
      text: res!.lastName!.capitalize(),
    );
  }

  selectRadio(String? hono) {
    if (hono == 'mr.') {
      selectedRadio = 1;
    } else if (hono == 'mrs.') {
      selectedRadio = 2;
    } else if (hono == 'ms.') {
      selectedRadio = 3;
    } else {
      selectedRadio = 5;
    }
  }

  Widget _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Stack(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 32, left: 16, right: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 10,
                            )
                          ]),
                      child: Form(
                        key: _formKey,
                        child: Card(
                          // elevation: 9.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 45.0,
                              left: 15,
                              right: 15,
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: textFieldHeader(
                                      'First Name',
                                      noPadding: true,
                                    ),
                                  ),
                                  TextFields.normalTextField(
                                    context,
                                    // fieldValue: _firstName,
                                    controller: _firstNameController,
                                    readOnly: edit,
                                    emptyValidationMessage:
                                        'FirstName cannot be empty',
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: textFieldHeader(
                                      'Last Name',
                                      noPadding: true,
                                    ),
                                  ),
                                  TextFields.normalTextField(
                                    context,
                                    // fieldValue: _lastName,
                                    controller: _lastNameController,
                                    readOnly: edit,
                                    emptyValidationMessage:
                                        'LastName cannot be empty',
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: textFieldHeader(
                                      'Honorific',
                                      noPadding: true,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Radio(
                                            value: 1,
                                            activeColor: Colors.green,
                                            autofocus: true,
                                            groupValue: selectedRadio,
                                            onChanged: (dynamic val) {
                                              selectedRadio = val;
                                              honorificValue = "Mr.";
                                              setState(() {});
                                            },
                                          ),
                                          Text(
                                            "Mr.",
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Radio(
                                            value: 2,
                                            groupValue: selectedRadio,
                                            activeColor: Colors.green,
                                            onChanged: (dynamic val) {
                                              selectedRadio = val;
                                              honorificValue = "Mrs.";
                                              print("Mrs is selected");
                                              setState(() {});
                                            },
                                          ),
                                          Text("Mrs."),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Radio(
                                            value: 3,
                                            groupValue: selectedRadio,
                                            activeColor: Colors.green,
                                            onChanged: (dynamic val) {
                                              selectedRadio = val;
                                              honorificValue = "Ms.";
                                              setState(() {});
                                            },
                                          ),
                                          Text("Ms."),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                ]),
                          ),
                        ),
                      )),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          shape: BoxShape.circle),
                      child: GestureDetector(
                        onTap: () async {
                          var image =
                              await pickImageFromGalleryOrCamera(context);
                          if (image == null) return;

                          double length = await image.length() / (1000 * 1000);
                          if (length < 5) {
                            setState(() {
                              _image = image;
                            });
                          } else {
                            Fluttertoast.showToast(
                              msg: 'File size must be less 5Mb',
                              gravity: ToastGravity.TOP,
                            );
                          }
                        },
                        child: context
                                    .watch<UserProvider>()
                                    .currentUser!
                                    .displayPictureURL !=
                                null
                            ? CachedImage(
                                radius: 80,
                                photo: res!.displayPictureURL == null ||
                                        res!.displayPictureURL!.isEmpty
                                    ? 'https://firebasestorage.googleapis.com/v0/b/circulate-app-a46a9.appspot.com/o/user.png?alt=media&token=4d94a267-f2da-41de-8bc2-5f2a46e321ca'
                                    : res!.displayPictureURL,
                              )
                            : CircleAvatar(
                                radius: 35,
                                backgroundColor: Color(0xffFDCF09),
                                child: _image != null
                                    ? ClipOval(
                                        child: Image.file(
                                          _image!,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        width: 100,
                                        height: 100,
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Button(
            buttonText: edit ? 'Edit' : 'Update',
            buttonColor: AppColors.yellowColor,
            onTap: () {
              setState(() {
                if (edit) {
                  edit = false;
                } else {
                  validateAndSubmit();
                }
              });
            },
            buttonTextStyle: TextStyles.buttonFontText,
            widthPercent: 0.8,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.background),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Container(
                  child: _body(context),
                ),
                _isloading
                    ? Container(
                        color: Colors.white.withOpacity(0.6),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
