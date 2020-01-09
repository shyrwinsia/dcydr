import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/togglepage/event.dart';
import 'package:dcydr/bloc/togglepage/state.dart';
import 'package:dcydr/data/dao.dart';

class TogglePageBloc extends Bloc<TogglePageEvent, TogglePageState> {
  @override
  TogglePageState get initialState => PageLoaded();

  @override
  Stream<TogglePageState> mapEventToState(
    TogglePageEvent event,
  ) async* {
    if (event is SaveListEvent) {
      await RandomListDao().update(event.list);
      yield PageLoaded(list: event.list);
    }
  }
}
