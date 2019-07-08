import 'package:Choosr/bloc/randomlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:Choosr/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(Choosr());

class Choosr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: RandomListBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Choosr',
          theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Raleway'),
          home: HomePage(title: 'Choosr'),
        ));
  }
}
