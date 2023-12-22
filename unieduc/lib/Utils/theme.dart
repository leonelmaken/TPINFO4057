// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const PRIMARY_COLOR = Color.fromARGB(255, 66, 160, 237);
// ignore: constant_identifier_names
const SECONDARY_COLOR = Colors.white;
const TEXT_COLOR=Color.fromARGB(255, 50, 48, 48);

ThemeData darkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
    scaffoldBackgroundColor: const Color.fromARGB(221, 255, 255, 255),
    splashColor: const Color.fromARGB(255, 0, 0, 0),
    brightness: Brightness.light,
    cardTheme: const CardTheme(
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 254, 255, 255),
      ),
      headline6: TextStyle(
        fontSize: 10.0,
        fontStyle: FontStyle.italic,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      bodyText1: TextStyle(
        fontSize: 10.0,
        fontFamily: 'Georgia',
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
    ),
    // cursorColor: const Color.fromRGBO(7, 28, 145, 0.95),
  );
}

ThemeData lightTheme() {
  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    primaryColor: Colors.black87,
    secondaryHeaderColor: const Color.fromARGB(208, 233, 230, 230),
    scaffoldBackgroundColor: Colors.black87,
    splashColor: const Color.fromARGB(255, 82, 0, 154),
    brightness: Brightness.light,
    cardTheme: const CardTheme(
      color: Colors.white,
    ),

    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      headline6: TextStyle(
        fontSize: 15.0,
        fontStyle: FontStyle.italic,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      bodyText1: TextStyle(
        fontSize: 12.0,
        fontFamily: 'Georgia',
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    ),
    // cursorColor: const Color.fromRGBO(7, 28, 145, 0.95),
  );
}
