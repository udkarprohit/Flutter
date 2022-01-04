// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: dartcreamColor,
      accentColor: dartcreamColor,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          // ignore: prefer_const_constructors
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.black,
      canvasColor: dartcreamColor,
      buttonColor: lightBluishColor,
      accentColor: Colors.white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          // ignore: prefer_const_constructors
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme.copyWith(
            headline6: context.textTheme.headline6?.copyWith(color: Colors.white)
          ),));

  static Color creamColor = const Color(0xfff5f5f5);
  static Color dartcreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
