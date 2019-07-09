import 'dart:async';
import 'package:Choosr/data/dao.dart';
import 'package:Choosr/data/types.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class RandomListBloc extends Bloc<RandomListEvent, RandomListState> {
  RandomListDao _randomListDao = RandomListDao();

  @override
  RandomListState get initialState => RandomListLoading();

  @override
  Stream<RandomListState> mapEventToState(
    RandomListEvent event,
  ) async* {
    if (event is LoadRandomList) {
      // Load list
      yield RandomListLoading();
      yield* _reloadRandomList();
    } else if (event is AddRandomList) {
      // Add list
      await _randomListDao.insert(RandomListGenerator.generate());
      yield* _reloadRandomList();
    } else if (event is UpdateRandomList) {
      final newRandomList = RandomListGenerator.generate();
      newRandomList.id = event.randomList.id;
      yield* _reloadRandomList();
    } else if (event is DeleteRandomList) {
      await _randomListDao.delete(event.randomList);
      yield* _reloadRandomList();
    }
  }

  Stream<RandomListState> _reloadRandomList() async* {
    final fruits = await _randomListDao.getAll();
    yield RandomListLoaded(fruits);
  }
}

class RandomListGenerator {
  static RandomList generate() {
    return new RandomList(name: "Sample List", icon: "Person");
  }
}
