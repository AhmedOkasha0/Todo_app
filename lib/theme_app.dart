import 'package:flutter/material.dart';

class ThemeScreen {
  static Color primarylight=Color(0xff5D9CEC);
  static Color backGroundColor=Color(0xffDFECDB);
  static Color gryeColor=Color(0xffC8C9CB);
  static Color darkMode=Color(0xff060E1E);






  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primarylight,

    ),
    scaffoldBackgroundColor: backGroundColor,
    textTheme: TextTheme(
      subtitle1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.white,
      ),
      subtitle2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline1: TextStyle(
        color: Color(0xff5D9CEC),
        fontSize: 18,
        fontWeight: FontWeight.bold
      )
    ),

    bottomNavigationBarTheme:BottomNavigationBarThemeData(
      selectedItemColor:primarylight ,
      unselectedItemColor:gryeColor,
      backgroundColor: Colors.transparent,
      elevation: 0,

    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primarylight,
    ),
  );

  static ThemeData DarkTheme = ThemeData(
    scaffoldBackgroundColor: darkMode,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primarylight,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.transparent,
      elevation: 0,

    ),

  );
}
