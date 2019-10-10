import 'package:flutter/material.dart';
import 'package:choosr/pages/homepage.dart';

void main() => runApp(Choosr());

class Choosr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choosr',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Raleway',
      ),
      home: HomePage(),
    );
  }
}
