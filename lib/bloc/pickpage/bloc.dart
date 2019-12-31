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
      this._pickedItem = _pickRandomItem(event.items);
      yield PickedItemState(pick: this._pickedItem);
    } else if (event is ToggleList) {
      yield MoveToToggleListPage();
    } else if (event is Reinitialize) {
      yield Uninitialized();
    } else {
      getLogger().wtf('Something went wrong.');
    }
  }

  String _pickRandomItem(List list) {
    String pick;
    // filter
    list = list.where((e) => e.selected).toList();
    list.length > 0
        ? list.length > 1
            ? pick = _pickItem(list)
            : pick = "Can't randomly pick from only one choice\n¯\\_(ツ)_/¯"
        : pick = 'Nothing to pick (◔_◔)';

    return pick;
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
