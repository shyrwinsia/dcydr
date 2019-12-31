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
      var _pick; // prevent consecutive
      do {
        _pick = _pickRandomItem(event.items);
      } while (_pick == this._pickedItem);
      this._pickedItem = _pick;
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
    // list.where((e) => e)
    list.length > 0
        ? list.length > 1
            ? pick = list.elementAt(rng.nextInt(list.length)).name
            : pick = "Can't randomly pick from only one choice\n¯\\_(ツ)_/¯"
        : pick = 'Nothing to pick (◔_◔)';

    return pick;
  }
}
