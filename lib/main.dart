import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dcydr/pages/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(Dcydr());
}

class Dcydr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dcydr',
      theme: getThemeData(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData getThemeData() {
    return ThemeData(
      fontFamily: 'GothamPro',
      iconTheme: IconThemeData(
        size: 18,
      ),
      hintColor: const Color(0x22000000),
      accentColor: const Color(0xff2a86cb),
      backgroundColor: const Color(0xfff7f7f9),
    );
  }
}
