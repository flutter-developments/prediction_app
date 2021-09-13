import 'package:flutter/material.dart';

class AppTheme {
  // Not sure if this is the best way to store themes.
  static final lightTheme = ThemeData(
    fontFamily: 'Poppins',
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(fontSize: 14),
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(50),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}
