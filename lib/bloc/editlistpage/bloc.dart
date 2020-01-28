import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/editlistpage/event.dart';
import 'package:dcydr/bloc/editlistpage/state.dart';
import 'package:dcydr/data/dao.dart';

class EditListPageBloc extends Bloc<EditListPageEvent, EditListPageState> {
  @override
  EditListPageState get initialState => Uninitialized();

  @override
  Stream<EditListPageState> mapEventToState(
    EditListPageEvent event,
  ) async* {
    if (event is SaveList) {
      yield Saving();
      await RandomListDao().update(event.list);
      yield Saved();
    }
  }
}
