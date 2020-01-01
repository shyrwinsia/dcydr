import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dcydr/bloc/homepage/event.dart';
import 'package:dcydr/bloc/homepage/state.dart';
import 'package:dcydr/data/dao.dart';
import 'package:dcydr/data/types.dart';
import 'package:dcydr/logger/logger.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  @override
  HomePageState get initialState => Uninitialized();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is LoadLists) {
      yield Loading();
      yield* _reloadLists();
    } else {
      getLogger().wtf('Something went wrong.');
    }
  }
}

Stream<HomePageState> _reloadLists() async* {
  final List<RandomList> list = await RandomListDao().getAll();
  yield Loaded(list: list);
}
