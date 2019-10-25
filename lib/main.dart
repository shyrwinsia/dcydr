import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/app_state.dart';
import 'package:dcydr/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:dcydr/pages/home.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dcydr/bloc/bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  // applying bloc delegate to override the transitions
  BlocSupervisor.delegate = SimpleBlocDelegate();
  Widget blocProvider = BlocProvider(
    builder: (context) {
      return AppBloc();
    },
    child: Dcydr(),
  );

  runApp(blocProvider);
}

class Dcydr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dcydr',
      theme: getThemeData(),
      home: buildBloc(context),
      debugShowCheckedModeBanner: false,
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
