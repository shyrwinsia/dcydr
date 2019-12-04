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
    print(this._pickedItem);
    if (event is PickItem) {
      this._pickedItem = _pickRandomItem(event.items);
      yield PickedItemState(pick: this._pickedItem);
    } else if (event is PickOptions) {
      yield MoveToPickOptionsPage();
    } else if (event is DeleteAction) {
      yield DeleteConfirmDialog();
    } else if (event is DeleteCancelled) {
      yield CloseConfirmDialog();
    } else if (event is DeleteConfirmed) {
      yield DeleteList();
    } else if (event is GetLastPickedItem) {
      if (_pickedItem != null)
        yield PickedItemState(pick: this._pickedItem);
      else
        yield Uninitialized();
    } else {
      getLogger().wtf('Something went wrong.');
    }
  }

  String _pickRandomItem(List list) {
    String pick;
    // TODO Store old picks up to 2 so it will not keep repeating
    list.length > 0
        ? list.length > 1
            ? pick = list.elementAt(rng.nextInt(list.length)).name
            : pick = "Can't randomly pick from only one choice\n¯\\_(ツ)_/¯"
        : pick = 'Nothing to pick (◔_◔)';

    return pick;
  }
}
