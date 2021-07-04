import 'package:flutter/material.dart';
import 'package:flutter_module/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Instagram",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            buttonColor: Colors.black,
            primaryIconTheme: IconThemeData(color: Colors.black),
            primaryTextTheme: TextTheme(
                bodyText1: TextStyle(color: Colors.black, fontFamily: "Aveny")),
            textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
        home: Home());
  }
}
