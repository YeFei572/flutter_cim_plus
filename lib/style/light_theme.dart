import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.pinkAccent,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
      textStyle:
          MaterialStateProperty.all(const TextStyle(color: Colors.white)),
    ),
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.pinkAccent,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.black54,
    selectedItemColor: Colors.pinkAccent,
    elevation: 0,
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    color: Colors.pinkAccent,
    elevation: 0,
  ),
  textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black)),
  radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(Colors.black),
      overlayColor: MaterialStateProperty.all(Colors.black)),
);
