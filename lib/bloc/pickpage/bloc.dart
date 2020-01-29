import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/pickpage/event.dart';
import 'package:dcydr/bloc/pickpage/state.dart';
import 'package:dcydr/logger/logger.dart';

class PickPageBloc extends Bloc<PickPageEvent, PickPageState> {
  final rng = Random();
  String _pickedItem;

  @override
  PickPageState get initialState => Uninitialized();

  @override
  Stream<PickPageState> mapEventToState(PickPageEvent event) async* {
    if (event is PickItem) {
      // filter
      List list = event.list.items.where((e) => e.selected).toList();
      if (list.length == 0)
        yield NoItemToPickState();
      else if (list.length == 1)
        yield CannotPickState();
      else {
        this._pickedItem = _pickItem(list);
        yield PickedItemState(pick: this._pickedItem);
      }
    } else if (event is Reinitialize) {
      yield Uninitialized();
    } else {
      getLogger().wtf('Something went wrong.');
    }
  }

  String _pickItem(List list) {
    String pick;
    // prevent conscutieve
    do {
      pick = list.elementAt(rng.nextInt(list.length)).name;
    } while (pick == this._pickedItem);
    return pick;
  }
}
