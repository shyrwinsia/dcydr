import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/pickpage/event.dart';
import 'package:dcydr/bloc/pickpage/state.dart';

class PickBloc extends Bloc<PickEvent, PickState> {
  @override
  PickState get initialState => InitialPickState();

  @override
  Stream<PickState> mapEventToState(
    PickEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
