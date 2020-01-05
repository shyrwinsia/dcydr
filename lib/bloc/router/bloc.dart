import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/router/event.dart';
import 'package:dcydr/bloc/router/state.dart';
import 'package:dcydr/logger/logger.dart';
import 'package:flutter/material.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  final GlobalKey<dynamic> routerKey;
  RouterBloc({this.routerKey});
  List stack = List();

  @override
  RouterState get initialState => RouterHomePage();

  @override
  Stream<RouterState> mapEventToState(
    RouterEvent event,
  ) async* {
    if (event is PopPage) {
      yield RouterPopPage(from: event.from);
    } else if (event is MoveToPickPage) {
      yield RouterPickPage(list: event.list);
    } else if (event is MoveToTogglePage) {
      yield RouterTogglePage(list: event.list);
    } else if (event is MoveToHomePage) {
      yield RouterHomePage();
    } else if (event is MoveToAddPage) {
      yield RouterAddPage();
    } else {
      getLogger().wtf('Something went wrong.');
    }
  }
}
