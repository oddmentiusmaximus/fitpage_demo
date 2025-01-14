import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  backgroundColor: Colors.white,
  cardColor: Colors.white,
  textTheme: TextTheme(
    titleMedium: TextStyle(color: Colors.black),
    bodySmall: TextStyle(color: Colors.black54),
    bodyLarge: TextStyle(color: Colors.black),
    labelSmall: TextStyle(color: Colors.black54),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey,
  backgroundColor: Colors.black,
  cardColor: Colors.black,
  textTheme: TextTheme(
    titleMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.white70),
    bodyLarge: TextStyle(color: Colors.white),
    labelSmall: TextStyle(color: Colors.white70),
  ),
);
