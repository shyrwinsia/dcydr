import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/router/event.dart';
import 'package:dcydr/bloc/router/state.dart';
import 'package:dcydr/logger/logger.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  @override
  RouterState get initialState => RouterHomePage();

  @override
  Stream<RouterState> mapEventToState(
    RouterEvent event,
  ) async* {
    if (event is MoveToPickPage) {
      yield RouterPickPage(list: event.list);
    } else if (event is MoveToHomePage) {
      yield RouterHomePage();
    } else if (event is MoveToAddPage) {
      yield RouterAddPage();
    } else {
      getLogger().wtf('Something went wrong.');
    }
  }
}
