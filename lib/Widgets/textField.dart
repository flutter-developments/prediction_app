import 'package:flutter/material.dart';
import 'package:girafee/utils/app_colors.dart';
import 'package:girafee/utils/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFields {
  static Widget emailTextField(
    BuildContext context, {
    String? hintText,
    TextEditingController? controller,
    String? validaterMsg,
    double widthPercentage = 1.0,
    Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      validator: (value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern as String);
        return (!regex.hasMatch(value!)) ? validaterMsg : null;
      },
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
    );
  }

  static Widget phoneNoTextField(
    BuildContext context, {
    String? hintText,
    TextEditingController? controller,
    var fieldValue,
    String? validaterMsg,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      validator: (value) {
        return (value!.isEmpty) ? validaterMsg : null;
      },
      keyboardType: TextInputType.phone,
    );
  }

  static Widget normalTextField(
    BuildContext context, {
    String? hintText,
    TextEditingController? controller,
    bool readOnly = false,
    String? emptyValidationMessage,
    TextInputType? inputType,
    int? maxLength,
  }) {
    return TextFormField(
      maxLength: maxLength,
      controller: controller,
      readOnly: readOnly,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(hintText: hintText),
      validator: (value) {
        return (value!.isEmpty) ? emptyValidationMessage : null;
      },
      keyboardType: inputType,
    );
  }

  static Widget passwordTextField(
    BuildContext context, {
    String? hintText,
    TextEditingController? controller,
    String? validaterMsg,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(hintText: hintText),
      validator: validator ??
          (value) {
            return (value!.length < 8) ? validaterMsg : null;
          },
    );
  }

  static Widget largeTextField(
    BuildContext context, {
    String? hintText,
    TextEditingController? controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: new InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      maxLines: 5,
      style: GoogleFonts.poppins(textStyle: TextStyles.textFieldFontText),
      validator: (value) {
        return (value!.isEmpty) ? 'Help Message cannot be empty' : null;
      },
    );
  }

  static Widget numberTextField(
    BuildContext context,
    TextEditingController controller, {
    Function(String)? onChanged,
    String? hintText,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(),
        hintText: hintText,
      ),
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
    );
  }

  @Deprecated("This is outdated due to changes in MaterialApp themeData")
  static Widget smallTextFieldNoBorder(
    BuildContext context,
    TextEditingController controller, {
    Function(String)? onChanged,
    String? hintText,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(),
        hintText: hintText,
      ),
      controller: controller,
      onChanged: onChanged,
    );
  }
}
