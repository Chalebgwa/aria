import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData myTheme = ThemeData(
  //fontFamily: "customFont",
  primaryColor: Colors.green.shade900,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        Colors.green.shade700,
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
    secondary: Colors.green,
  ),
);
