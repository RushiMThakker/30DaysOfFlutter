import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home.dart';
import 'package:flutter_catalog/pages/login.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeCollection.lightTheme(context),
      darkTheme: ThemeCollection.darkTheme(context),
      initialRoute: MyRoutes.HOME_ROUTE,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.HOME_ROUTE: (context) => HomePage(),
        MyRoutes.LOGIN_ROUTE: (context) => LoginPage()
      },
    );
  }
}
