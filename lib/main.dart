import 'package:flutter/material.dart';
import 'package:RandoomPickr/pages/home.dart';

void main() => runApp(RandoomPickr());

class RandoomPickr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Randoom Pickr',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Raleway'),
      home: HomePage(title: 'Randoom Pickr'),
    );
  }
}
