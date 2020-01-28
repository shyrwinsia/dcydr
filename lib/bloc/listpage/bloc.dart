import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/listpage/event.dart';
import 'package:dcydr/bloc/listpage/state.dart';
import 'package:dcydr/data/dao.dart';

class ListPageBloc extends Bloc<ListPageEvent, ListPageState> {
  @override
  ListPageState get initialState => Uninitialized();

  @override
  Stream<ListPageState> mapEventToState(
    ListPageEvent event,
  ) async* {
    if (event is CreateList) {
      yield Saving();
      await RandomListDao().insert(event.list);
      yield Saved();
    } else if (event is UpdateList) {
      yield Saving();
      await RandomListDao().update(event.list);
      yield Saved();
    }
  }
}
