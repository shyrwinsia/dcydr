import 'package:dcydr/data/dao.dart';
import 'package:dcydr/data/types.dart';

class SampleData {
  static final SampleData _singleton = SampleData();
  static SampleData get instance => _singleton;

  addDefaultData() async {
    await RandomListDao().insert(
      RandomList(
        name: 'Rock-Paper-Scissors',
        type: 'star',
        items: <RandomListItem>[
          RandomListItem(name: 'Rock', selected: true),
          RandomListItem(name: 'Paper', selected: true),
          RandomListItem(name: 'Scissors', selected: true),
          RandomListItem(name: 'Lizard', selected: false),
          RandomListItem(name: 'Spock', selected: false),
        ],
      ),
    );
    await RandomListDao().insert(
      RandomList(
        name: 'Lunch places',
        type: 'location',
        items: <RandomListItem>[
          RandomListItem(name: "Slave Food", selected: true),
          RandomListItem(name: "Korean one-North", selected: true),
          RandomListItem(name: "Koufu one-North", selected: true),
          RandomListItem(name: "Subway one-North", selected: true),
          RandomListItem(name: "Bismillah Biryani", selected: true),
          RandomListItem(name: "Arkadas Cafe", selected: true),
          RandomListItem(name: "Burger King Vivo", selected: true),
          RandomListItem(name: "Kopitiam Vivo", selected: true),
          RandomListItem(name: "Texas Vivo", selected: true),
          RandomListItem(name: "Stuff'd Vivo", selected: true),
          RandomListItem(name: "Segar Buona Vista", selected: true),
          RandomListItem(name: "Korean Bouna Vista", selected: true),
          RandomListItem(name: "Texas Bouna Vista", selected: true),
          RandomListItem(name: "Burger King NUH", selected: true),
          RandomListItem(name: "Hawker NUH", selected: true),
          RandomListItem(name: "Kopitiam NUH", selected: true),
          RandomListItem(name: "Holland Village", selected: true),
          RandomListItem(name: "Al Amaan", selected: true),
        ],
      ),
    );
    await RandomListDao().insert(
      RandomList(
        name: 'Impulse buying items',
        type: 'tag',
        items: <RandomListItem>[
          RandomListItem(name: 'A', selected: true),
        ],
      ),
    );
    await RandomListDao().insert(
      RandomList(
        name: 'Random words',
        type: 'megaphone',
        items: <RandomListItem>[
          RandomListItem(name: 'AB', selected: true),
          RandomListItem(name: 'AC', selected: true),
          RandomListItem(name: 'AD', selected: true),
          RandomListItem(name: 'BA', selected: true),
          RandomListItem(name: 'BB', selected: true),
          RandomListItem(name: 'BC', selected: true),
        ],
      ),
    );
    await RandomListDao().insert(
      RandomList(
        name: 'Innovation ideas',
        type: 'idea',
        items: <RandomListItem>[
          RandomListItem(name: 'A', selected: true),
          RandomListItem(name: 'B', selected: true),
          RandomListItem(name: 'C', selected: true),
          RandomListItem(name: 'D', selected: true),
          RandomListItem(name: 'E', selected: true),
          RandomListItem(name: 'F', selected: true),
        ],
      ),
    );
    await RandomListDao().insert(
      RandomList(
        name: 'Personal treats',
        type: 'diamond',
        items: <RandomListItem>[
          RandomListItem(name: 'A', selected: true),
          RandomListItem(name: 'B', selected: true),
          RandomListItem(name: 'C', selected: true),
          RandomListItem(name: 'D', selected: true),
          RandomListItem(name: 'E', selected: true),
          RandomListItem(name: 'F', selected: true),
        ],
      ),
    );
    await RandomListDao().insert(
      RandomList(
        name: 'Grocery items',
        type: 'list',
        items: <RandomListItem>[
          RandomListItem(name: 'A', selected: true),
          RandomListItem(name: 'B', selected: true),
          RandomListItem(name: 'C', selected: true),
          RandomListItem(name: 'D', selected: true),
          RandomListItem(name: 'E', selected: true),
          RandomListItem(name: 'F', selected: true),
        ],
      ),
    );
    RandomListDao().insert(
      RandomList(
        name: 'Team members',
        type: 'user',
        items: <RandomListItem>[
          RandomListItem(name: 'A', selected: true),
          RandomListItem(name: 'B', selected: true),
          RandomListItem(name: 'C', selected: true),
          RandomListItem(name: 'D', selected: true),
          RandomListItem(name: 'E', selected: true),
          RandomListItem(name: 'F', selected: true),
        ],
      ),
    );
  }
}
