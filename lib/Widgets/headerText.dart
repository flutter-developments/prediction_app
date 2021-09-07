import 'package:flutter/material.dart';
import 'package:girafee/utils/styles.dart';
import 'package:google_fonts/google_fonts.dart';

Padding displayHeaderText(
  String text, {
  EdgeInsets padding =
      const EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
}) {
  return Padding(
    padding: padding,
    child: Text(
      text,
      style: GoogleFonts.poppins(
          textStyle:
              TextStyles.buttonFontText.copyWith(fontWeight: FontWeight.w600)),
    ),
  );
}

SizedBox displayEmptySpace() => SizedBox(height: 30);

Padding textFieldHeader(String text,
    {bool noPadding = false, bool required = false}) {
  return Padding(
    padding: noPadding
        ? const EdgeInsets.all(0)
        : const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
    child: RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(
          textStyle: TextStyles.headerFontText,
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: text,
            // text: 'Password',
            style: TextStyles.headerFontText,
          ),
          TextSpan(
            text: required ? '*' : '',
            style: TextStyle(
              color: Colors.red,
            ),
          )
        ],
      ),
    ),
  );
}
