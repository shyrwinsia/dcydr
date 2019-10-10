import 'package:flutter/material.dart';
import 'package:choosr/pages/homepage.dart';

void main() => runApp(Choosr());

class Choosr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choosr',
      theme: ThemeData(
        fontFamily: 'Raleway',
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Raleway',
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}
