import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryLight = const Color(0xFF5D9CEC);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color blackColor = const Color(0xFF383838);
  static Color redColor = const Color(0xFFEC4B4B);
  static Color greenColor = const Color(0xFF61E757);
  static Color grey = const Color(0xFFC8C9CB);
  static Color bodyColorWhite = const Color(0xFFDFECDB);

  /// Dark Colors
  static Color primaryDark = const Color(0xFF141922);
  static Color bodyColorblack = const Color(0xFF060E1E);
  static ThemeData lightTheme = itThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: bodyColorWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
