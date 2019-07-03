import 'package:flutter/material.dart';
import 'package:Choosr/pages/home.dart';

void main() => runApp(Choosr());

class Choosr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Choosr',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Raleway'),
      home: HomePage(title: 'Choosr'),
    );
  }
}
