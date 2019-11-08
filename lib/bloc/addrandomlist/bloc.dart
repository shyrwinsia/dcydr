import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/addrandomlist/event.dart';
import 'package:dcydr/bloc/addrandomlist/state.dart';
import 'package:dcydr/data/dao.dart';

class RandomlistBloc extends Bloc<RandomListEvent, RandomListState> {
  @override
  RandomListState get initialState => ListItemState();

  @override
  Stream<RandomListState> mapEventToState(
    RandomListEvent event,
  ) async* {
    if (event is AddItemToList) {
      yield ListItemState(list: event.list);
    } else if (event is SubmitList) {
      final id = await RandomListDao().insert(event.list);
      if (id)
        yield Success();
      else
        Failed();
    }
  }
}
