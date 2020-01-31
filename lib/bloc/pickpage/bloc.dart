import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/pickpage/event.dart';
import 'package:dcydr/bloc/pickpage/state.dart';
import 'package:dcydr/data/dao.dart';
import 'package:dcydr/data/types.dart';
import 'package:dcydr/logger/logger.dart';

class PickPageBloc extends Bloc<PickPageEvent, PickPageState> {
  final rng = Random();

  @override
  PickPageState get initialState => Uninitialized();

  @override
  Stream<PickPageState> mapEventToState(PickPageEvent event) async* {
    if (event is PickItem) {
      yield* _pickItem(event.list);
    } else if (event is Reinitialize) {
      yield Uninitialized();
    } else if (event is DeleteList) {
      yield Saving();
      await RandomListDao().delete(event.list);
      yield Saved();
    } else {
      getLogger().wtf('Something went wrong.');
    }
  }

  Stream<PickPageState> _pickItem(RandomList randomlist) async* {
    // filter
    List filteredlist = randomlist.items.where((e) => e.selected).toList();
    if (randomlist.items.length < 2) {
      yield TooFewItemsState();
    } else if (filteredlist.length < 2) {
      yield TooManyToggledState();
    } else {
      // prevent consecutive
      String lastPicked = await PickedItemsDao().getLastPicked(randomlist.key);
      String pick;
      do {
        pick = filteredlist.elementAt(rng.nextInt(filteredlist.length)).name;
      } while (pick == lastPicked);
      // store picked
      lastPicked == null
          ? PickedItemsDao().insert(randomlist.key, pick)
          : PickedItemsDao().update(randomlist.key, pick);
      yield PickedItemState(pick: pick);
    }
  }
}
