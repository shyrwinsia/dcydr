import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/addlistpage/event.dart';
import 'package:dcydr/bloc/addlistpage/state.dart';

class AddListPageBloc extends Bloc<AddListPageEvent, AddListPageState> {
  @override
  AddListPageState get initialState => Uninitialized();

  @override
  Stream<AddListPageState> mapEventToState(
    AddListPageEvent event,
  ) async* {}
}
