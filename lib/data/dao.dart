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
    final finder = Finder(filter: Filter.byKey(list.key));
    await _randomListStore.update(await _db, list.toMap(), finder: finder);
  }

  Future delete(RandomList list) async {
    final finder = Finder(filter: Filter.byKey(list.key));
    await PickedItemsDao().delete(list.key);
    await _randomListStore.delete(await _db, finder: finder);
  }

  Future<List<RandomList>> getAll() async {
    final recordSnapshots = await _randomListStore.find(await _db);

    return recordSnapshots.map((snapshot) {
      return RandomList.fromMap(snapshot.key, snapshot.value);
    }).toList();
  }
}

class PickedItemsDao {
  static const String PICKED_ITEMS_STORE_NAME = 'picked-items';
  final _pickedItemsStore = intMapStoreFactory.store(PICKED_ITEMS_STORE_NAME);
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(int listId, String pick) async {
    await _pickedItemsStore.add(
      await _db,
      {
        'listid': listId,
        'pick': pick,
      },
    );
  }

  Future update(int listId, String pick) async {
    final finder = Finder(filter: Filter.equal('listid', listId));
    await _pickedItemsStore.update(
      await _db,
      {
        'listid': listId,
        'pick': pick,
      },
      finder: finder,
    );
  }

  Future<String> getLastPicked(int listId) async {
    final finder = Finder(filter: Filter.equal('listid', listId));
    final recordSnapshots =
        await _pickedItemsStore.find(await _db, finder: finder);

    List list = recordSnapshots.map((snapshot) {
      return snapshot.value['pick'];
    }).toList();

    return list.length > 0 ? list.first : null;
  }

  Future delete(int listId) async {
    final finder = Finder(filter: Filter.equal('listid', listId));
    await _pickedItemsStore.delete(await _db, finder: finder);
  }
}
