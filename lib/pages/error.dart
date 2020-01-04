import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: Center(
            child: Text(
              'Something went wrong.\nTry restarting the app.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0x88000000),
                fontSize: 30,
              ),
            ),
          ),
        ),
      );
}
