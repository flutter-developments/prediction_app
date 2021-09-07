import 'package:flutter/material.dart';
import 'package:girafee/Widgets/headerText.dart';
import 'package:girafee/Widgets/textField.dart';
import 'package:girafee/utils/app_colors.dart';
import 'package:girafee/utils/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import 'button.dart';

final _formKey = GlobalKey<FormState>();
TextEditingController? firstNameController;
TextEditingController? lastNameController;
TextEditingController? emailController;
TextEditingController? phoneNumberController;

bool validateAndSave() {
  final form = _formKey.currentState!;
  form.save();
  if (form.validate()) {
    return true;
  } else {
    return false;
  }
}

init() {
  firstNameController = TextEditingController();
  lastNameController = TextEditingController();
  emailController = TextEditingController();
  phoneNumberController = TextEditingController();
}

dispose() {
  firstNameController!.dispose();
  lastNameController!.dispose();
  emailController!.dispose();
  phoneNumberController!.dispose();
}

displayAddTeamMemberDialogue(BuildContext context) {
  init();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Stack(fit: StackFit.loose, children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Card(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, left: 15.0, right: 15.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: CircleAvatar(
                                        backgroundColor:
                                            AppColors.greyBackColor,
                                        radius: 30,
                                        // child: Icon(Icons.person),
                                        backgroundImage: AssetImage(
                                            'assets/appIcons/image47.png'),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'CBA PLUMBING INC',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyles.buttonFontText),
                                    ),
                                  ],
                                ),
                                textFieldHeader('First Name'),
                                Center(
                                    child: TextFields.normalTextField(context,
                                        controller: firstNameController,
                                        emptyValidationMessage:
                                            'First Name Cannot be empty')),
                                textFieldHeader('Last Name'),
                                Center(
                                    child: TextFields.normalTextField(context,
                                        controller: lastNameController,
                                        emptyValidationMessage:
                                            'Last Name Cannot be empty')),
                                textFieldHeader('Email Address'),
                                Center(
                                    child: TextFields.emailTextField(context,
                                        controller: emailController,
                                        validaterMsg: 'Email is  Incorrect')),
                                textFieldHeader('Mobile Number'),
                                Center(
                                    child: TextFields.phoneNoTextField(context,
                                        hintText: ('( 123 )'),
                                        controller: phoneNumberController)),
                                displayEmptySpace(),
                                Button(
                                  buttonText: 'Send invation',
                                  buttonColor: AppColors.yellowColor,
                                  onTap: () {},
                                  buttonTextStyle: TextStyles.buttonFontText,
                                  widthPercent: 0.8,
                                ),
                                displayEmptySpace(),
                              ]),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FloatingActionButton(
                        heroTag: 'Close',
                        backgroundColor: AppColors.white,
                        mini: true,
                        onPressed: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          color: AppColors.blackTextColor,
                          size: 40,
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ));
    },
  );
}
