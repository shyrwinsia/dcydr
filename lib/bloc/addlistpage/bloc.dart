import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/addlistpage/event.dart';
import 'package:dcydr/bloc/addlistpage/state.dart';
import 'package:dcydr/data/types.dart';

class AddListPageBloc extends Bloc<AddListPageEvent, AddListPageState> {
  RandomList _randomList;

  @override
  AddListPageState get initialState => Uninitialized();

  @override
  Stream<AddListPageState> mapEventToState(
    AddListPageEvent event,
  ) async* {
    if (state is Uninitialized) {
      this._randomList = RandomList.empty();
    }
  }
}
