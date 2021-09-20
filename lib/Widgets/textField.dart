// import 'package:flutter/material.dart';
// import 'package:girafee/utils/app_colors.dart';
// import 'package:girafee/utils/styles.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';

class TextFields {
  static Widget emailTextField(
    BuildContext context, {
    required IconData icon,
    String? hintText,
    TextEditingController? controller,
    bool readOnly = false,
    String? emptyValidationMessage,
    TextInputType? inputType,
    int? maxLength,
    String? validaterMsg,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          Pattern pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regex = new RegExp(pattern as String);
          return (!regex.hasMatch(value!)) ? validaterMsg : null;
        },
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: AppColors.textColor),
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(
              color: AppColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w400),
          filled: true,
          fillColor: Color(0xFF50566C),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: Color(0xFF50566C), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),
      ),
    );
  }

  static Widget normalTextField(
    BuildContext context, {
    IconData? icon,
    String? hintText,
    TextEditingController? controller,
    bool readOnly = false,
    String? emptyValidationMessage,
    TextInputType? inputType,
    int? maxLength,
    required Color color,
  }) {
    return TextFormField(
      style: mediumwhiteStyle,
      decoration: InputDecoration(
          // hintText: hintText,
          labelText: hintText,
          // labelStyle: TextStyle(
          //     color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),
          labelStyle: GoogleFonts.raleway(
              color: AppColors.textColor,
              fontSize: 15,
              fontWeight: FontWeight.w600),
          filled: true,
          fillColor: Color(0xFF50566C),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            borderSide: BorderSide(color: Color(0xff50566C), width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                15.0,
              ),
            ),
            borderSide: BorderSide(color: AppColors.white, width: 2),
          ),
          //contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
          prefixIcon: Icon(
            icon,
            color: AppColors.textColor,
          )),
    );
  }

  static Widget passwordTextField(
    BuildContext context, {
    IconData? icon,
    String? hintText,
    TextEditingController? controller,
    bool readOnly = false,
    String? emptyValidationMessage,
    TextInputType? inputType,
  }) {
    return TextFormField(
      decoration: InputDecoration(
          // hintText: hintText,
          labelText: hintText,
          // labelStyle: TextStyle(
          //     color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),
          labelStyle: GoogleFonts.raleway(
              color: AppColors.textColor,
              fontSize: 15,
              fontWeight: FontWeight.w600),
          filled: true,
          fillColor: Color(0xFF50566C),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            borderSide: BorderSide(color: Color(0xff50566C), width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            //borderSide: BorderSide(color: AppColors.bar_color, width: 2),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          prefixIcon: Icon(
            icon,
            color: AppColors.textColor,
          )),
    );
  }
}
//   static Widget passwordTextField(
//     BuildContext context, {
//     String? hintText,
//     TextEditingController? controller,
//     String? validaterMsg,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: true,
//       decoration: InputDecoration(hintText: hintText),
//       validator: validator ??
//           (value) {
//             return (value!.length < 8) ? validaterMsg : null;
//           },
//     );
//   }

//   static Widget largeTextField(
//     BuildContext context, {
//     String? hintText,
//     TextEditingController? controller,
//   }) {
//     return TextFormField(
//       controller: controller,
//       decoration: new InputDecoration(
//         contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
//         hintText: hintText,
//         hintStyle: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
//         fillColor: Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey, width: 0.5),
//           borderRadius: BorderRadius.circular(25),
//         ),
//       ),
//       maxLines: 5,
//       style: GoogleFonts.poppins(textStyle: TextStyles.textFieldFontText),
//       validator: (value) {
//         return (value!.isEmpty) ? 'Help Message cannot be empty' : null;
//       },
//     );
//   }

//   static Widget numberTextField(
//     BuildContext context,
//     TextEditingController controller, {
//     Function(String)? onChanged,
//     String? hintText,
//   }) {
//     return TextFormField(
//       decoration: InputDecoration(
//         border: UnderlineInputBorder(),
//         enabledBorder: UnderlineInputBorder(),
//         hintText: hintText,
//       ),
//       controller: controller,
//       onChanged: onChanged,
//       keyboardType: TextInputType.number,
//     );
//   }

//   @Deprecated("This is outdated due to changes in MaterialApp themeData")
//   static Widget smallTextFieldNoBorder(
//     BuildContext context,
//     TextEditingController controller, {
//     Function(String)? onChanged,
//     String? hintText,
//   }) {
//     return TextFormField(
//       decoration: InputDecoration(
//         border: UnderlineInputBorder(),
//         enabledBorder: UnderlineInputBorder(),
//         hintText: hintText,
//       ),
//       controller: controller,
//       onChanged: onChanged,
//     );
//   }
// }
