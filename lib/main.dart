// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
        
        darkTheme: MyTheme.darkTheme(context),
        initialRoute: MyRoutes.LoginRoute,
        routes: {
          "/": (context) => LoginPage(),
          MyRoutes.HomeRoute : (context) => HomePage(),
          MyRoutes.LoginRoute: (context) => LoginPage(),
          MyRoutes.cartRoute: (context) => CartPage()
        },
    );
  }
}
