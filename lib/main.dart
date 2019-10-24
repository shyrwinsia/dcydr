import 'package:bloc/bloc.dart';
import 'package:choosr/bloc/app_state.dart';
import 'package:choosr/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:choosr/pages/home.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:choosr/bloc/bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  // applying bloc delegate to override the transitions
  BlocSupervisor.delegate = SimpleBlocDelegate();
  Widget blocProvider = BlocProvider(
    builder: (context) {
      return AppBloc()..dispatch(StartedApp());
    },
    child: Choosr(),
  );

  runApp(blocProvider);
}

class Choosr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choosr',
      theme: getThemeData(),
      home: buildBloc(context),
    );
  }

  Widget buildBloc(context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is Uninitialized) return SplashPage();
        if (state is Loaded) return HomePage();
        return SplashPage();
      },
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
