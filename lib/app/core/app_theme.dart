import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryLight = const Color(0xFF5D9CEC);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color blackColor = const Color(0xFF383838);
  static Color redColor = const Color(0xFFEC4B4B);
  static Color greenColor = const Color(0xFF61E757);
  static Color grey = const Color.fromARGB(255, 148, 150, 153);
  static Color bodyColorWhite = const Color(0xFFDFECDB);

  /// Dark Colors
  static Color primaryDark = const Color(0xFF141922);
  static Color bodyColorblack = const Color(0xFF060E1E);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: bodyColorWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryLight,
        unselectedItemColor: grey,
        backgroundColor: Colors.transparent,
        elevation: 0.0),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      // TODO: Solution 1
      // shape: RoundedRectangleBorder(side: BorderSide(width: 3, color: whiteColor), borderRadius: BorderRadius.circular(100)),
      // TODO: Solution 2
      shape: StadiumBorder(side: BorderSide(color: whiteColor, width: 6)),
      backgroundColor: primaryLight,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
          fontSize: 20, color: blackColor, fontWeight: FontWeight.w900),
      titleSmall: TextStyle(
          fontSize: 18, color: blackColor, fontWeight: FontWeight.w700),
    ),
  );
}
