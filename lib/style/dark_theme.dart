import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff2B2B2B),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
        textStyle:
            MaterialStateProperty.all(const TextStyle(color: Colors.black)),
      ),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff323232),
    backgroundColor: const Color(0xff323232),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff2B2B2B),
      unselectedItemColor: Colors.white60,
      selectedItemColor: Colors.lightBlueAccent,
      elevation: 0,
    ),
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      color: Color(0xff2B2B2B),
      elevation: 0.5,
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white)),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(Colors.white),
    ));
