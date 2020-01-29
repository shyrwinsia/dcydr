import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/pickpage/event.dart';
import 'package:dcydr/bloc/pickpage/state.dart';
import 'package:dcydr/data/types.dart';
import 'package:dcydr/logger/logger.dart';

class PickPageBloc extends Bloc<PickPageEvent, PickPageState> {
  final rng = Random();
  String _pickedItem;

  @override
  PickPageState get initialState => Uninitialized();

  @override
  Stream<PickPageState> mapEventToState(PickPageEvent event) async* {
    if (event is PickItem) {
      yield* _pickItem(event.list);
    } else if (event is Reinitialize) {
      yield Uninitialized();
    } else {
      getLogger().wtf('Something went wrong.');
    }
  }

  Stream<PickPageState> _pickItem(RandomList randomlist) async* {
    // filter
    List filteredlist = randomlist.items.where((e) => e.selected).toList();
    if (filteredlist.length == 0) {
      yield NoItemToPickState();
    } else if (filteredlist.length == 1) {
      yield CannotPickState();
    } else {
      String pick;
      // prevent consecutive
      do {
        pick = filteredlist.elementAt(rng.nextInt(filteredlist.length)).name;
      } while (pick == this._pickedItem);

      yield PickedItemState(pick: pick);
    }
  }
}
