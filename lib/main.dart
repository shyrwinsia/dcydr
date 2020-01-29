import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/blocdelegate.dart';
import 'package:dcydr/bloc/homepage/bloc.dart';
import 'package:dcydr/bloc/homepage/event.dart';
import 'package:dcydr/bloc/listpage/bloc.dart';
import 'package:dcydr/bloc/pickpage/bloc.dart';
import 'package:dcydr/bloc/router/bloc.dart';
import 'package:dcydr/bloc/router/event.dart';
import 'package:dcydr/bloc/router/state.dart';
import 'package:dcydr/pages/addlist.dart';
import 'package:dcydr/pages/editlist.dart';
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

class Dcydr extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DcydrState();
}

class _DcydrState extends State<Dcydr> {
  String icon = 'generic';
  HomePageBloc _homePageBloc;

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
  Widget _buildRouter() {
    _homePageBloc = HomePageBloc();
    return BlocListener<RouterBloc, RouterState>(
      listener: (context, state) {
        if (state is RouterAddPage)
          _pushPage(
              context,
              BlocProvider(
                child: AddListPage(),
                create: (BuildContext context) => ListPageBloc(),
              ),
              () => _homePageBloc.add(LoadLists()));
        else if (state is RouterEditPage)
          _pushPage(
            context,
            BlocProvider(
              child: EditListPage(list: state.list),
              create: (BuildContext context) => ListPageBloc(),
            ),
            () {
              Navigator.pop(context);
            },
          );
        else if (state is RouterPickPage)
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
      },
      child: BlocProvider(
        child: HomePage(),
        create: (BuildContext context) => _homePageBloc..add(LoadLists()),
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page, [Function callback]) =>
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => page,
        ),
      )
          .then((onValue) => BlocProvider.of<RouterBloc>(context)
              .add(PopPage(from: page.hashCode.toString())))
          .then((onValue) => callback());
}
