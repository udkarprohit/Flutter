// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData( 
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: MyRoutes.HomeRoute,
        routes: {
          "/": (context) => LoginPage(),
          MyRoutes.HomeRoute : (context) => HomePage(),
          MyRoutes.LoginRoute: (context) => LoginPage()
        },
    );
  }
}
