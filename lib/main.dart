import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/blocdelegate.dart';
import 'package:dcydr/bloc/homepage/bloc.dart';
import 'package:dcydr/bloc/homepage/event.dart';
import 'package:dcydr/bloc/pickpage/bloc.dart';
import 'package:dcydr/bloc/router/bloc.dart';
import 'package:dcydr/bloc/router/event.dart';
import 'package:dcydr/bloc/router/state.dart';
import 'package:dcydr/pages/home.dart';
import 'package:dcydr/pages/pick.dart';
import 'package:dcydr/pages/toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // applying bloc delegate to override the transitions
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(
    Dcydr(),
  );
}

class Dcydr extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider<RouterBloc>(
        create: (BuildContext context) => RouterBloc()..add(MoveToHomePage()),
        child: MaterialApp(
          title: 'Dcydr',
          theme: getThemeData(),
          home: _buildRouter(),
          debugShowCheckedModeBanner: false,
        ),
      );

  ThemeData getThemeData() => ThemeData(
        fontFamily: 'GothamPro',
        iconTheme: IconThemeData(
          size: 18,
        ),
        hintColor: const Color(0x22000000),
        accentColor: const Color(0xff2a86cb),
        backgroundColor: const Color(0xfff7f7f9),
      );

  // router listenr
  Widget _buildRouter() => BlocListener<RouterBloc, RouterState>(
        listener: (context, state) {
          if (state is RouterPickPage)
            _pushPage(
              context,
              BlocProvider(
                child: PickPage(list: state.list),
                create: (BuildContext context) => PickPageBloc(),
              ),
            );
          else if (state is RouterTogglePage)
            _pushPage(
              context,
              TogglePage(list: state.list),
            );
          else if (state is RouterPopPage) {
            Navigator.pop(context);
          }
        },
        child: BlocProvider(
          child: HomePage(),
          create: (BuildContext context) => HomePageBloc()..add(LoadLists()),
        ),
      );

  void _pushPage(BuildContext context, Widget page) => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => page,
        ),
      );
}
