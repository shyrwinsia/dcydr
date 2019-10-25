import 'package:dcydr/data/database.dart';
import 'package:dcydr/data/types.dart';
import 'package:sembast/sembast.dart';

class RandomListDao {
  static const String RANDOM_LIST_STORE_NAME = 'random-list';
  final _randomListStore = intMapStoreFactory.store(RANDOM_LIST_STORE_NAME);
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(RandomList list) async {
    await _randomListStore.add(await _db, list.toMap());
  }

  Future update(RandomList list) async {
    // final finder = Finder(filter: Filter.byKey(list.id));
    // await _randomListStore.update(await _db, list.toMap(), finder: finder);
  }

  Future delete(RandomList list) async {
    // final finder = Finder(filter: Filter.byKey(list.id));
    // await _randomListStore.delete(await _db, finder: finder);
  }

  Future<List<RandomList>> getAll() async {
    final recordSnapshots = await _randomListStore.find(await _db);

    return recordSnapshots.map((snapshot) {
      final list = RandomList.fromMap(snapshot.key, snapshot.value);
      return list;
    }).toList();
  }
}
