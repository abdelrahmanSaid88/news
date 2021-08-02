import 'package:flutter/material.dart';
import 'package:news/ThemeProvider.dart';
import 'package:news/home/HomeScreen.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primaryColor: MyThemeData.darkgreen,
          scaffoldBackgroundColor: Colors.transparent),
      routes: {
        HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.ROUTE_NAME,
    );
  }
}
