import 'package:choosr/data/types.dart';
import 'package:choosr/pages/addpage.dart';
import 'package:choosr/pages/pickpage.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class HomePage extends StatelessWidget {
  final List _list = List<RandomList>();

  HomePage() {
    _list
      ..add(RandomList(
        name: 'Thingz to buy',
        type: 'tag',
        items: <RandomListItem>[
          RandomListItem(name: 'A', selected: true),
        ],
      ))
      ..add(RandomList(
        name: 'Speaking notes',
        type: 'megaphone',
        items: <RandomListItem>[
          RandomListItem(name: 'AB', selected: true),
          RandomListItem(name: 'AC', selected: true),
          RandomListItem(name: 'AD', selected: true),
          RandomListItem(name: 'BA', selected: true),
          RandomListItem(name: 'BB', selected: true),
          RandomListItem(name: 'BC', selected: true),
        ],
      ))
      ..add(RandomList(
        name: 'Shitty ideas',
        type: 'idea',
        items: <RandomListItem>[
          RandomListItem(name: 'Kill yourself', selected: true),
          RandomListItem(name: 'Rob a bank', selected: true),
          RandomListItem(name: 'Fuck a whore', selected: true),
          RandomListItem(name: 'Drink gasoline', selected: true),
          RandomListItem(name: 'Drive off a cliff', selected: true),
          RandomListItem(name: 'Slap your boss', selected: true),
        ],
      ))
      ..add(RandomList(
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
      ))
      ..add(RandomList(
        name: 'Stupid things',
        type: 'star',
        items: <RandomListItem>[
          RandomListItem(name: 'Dance', selected: true),
          RandomListItem(name: 'Kick', selected: true),
          RandomListItem(name: 'Run', selected: true),
        ],
      ))
      ..add(RandomList(
        name: 'Whatever',
        type: 'diamond',
        items: <RandomListItem>[
          RandomListItem(name: 'A', selected: true),
          RandomListItem(name: 'B', selected: true),
          RandomListItem(name: 'C', selected: true),
          RandomListItem(name: 'D', selected: true),
          RandomListItem(name: 'E', selected: true),
          RandomListItem(name: 'F', selected: true),
        ],
      ))
      ..add(RandomList(
        name: 'Generic list',
        type: 'list',
        items: <RandomListItem>[
          RandomListItem(name: 'A', selected: true),
          RandomListItem(name: 'B', selected: true),
          RandomListItem(name: 'C', selected: true),
          RandomListItem(name: 'D', selected: true),
          RandomListItem(name: 'E', selected: true),
          RandomListItem(name: 'F', selected: true),
        ],
      ))
      ..add(RandomList(
        name: 'Team membahs',
        type: 'user',
        items: <RandomListItem>[
          RandomListItem(name: 'A', selected: true),
          RandomListItem(name: 'B', selected: true),
          RandomListItem(name: 'C', selected: true),
          RandomListItem(name: 'D', selected: true),
          RandomListItem(name: 'E', selected: true),
          RandomListItem(name: 'F', selected: true),
        ],
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: const Color(0xff13b6cb),
        backgroundColorEnd: const Color(0xff2a86cb),
        centerTitle: true,
        title: Text("Choosr"),
        actions: <Widget>[
          IconButton(
            onPressed: () => _navigateToAddRandomListPage(context),
            icon: Icon(
              FlatIcons.add_3,
              size: 18,
            ),
          )
        ],
        elevation: 0,
      ),
      body: _createList(_list, context),
    );
  }

// RandomList _placesToEat = new RandomList("Where to eat", IconType.Place);

  Widget _createList(List<RandomList> list, BuildContext context) {
    final Iterable<ListTile> tiles = list.map(
      (r) {
        return ListTile(
          leading: r.icon,
          title: Text(
            r.name,
          ),
          trailing: Icon(
            FlatIcons.con_right_arrow_1_a,
            color: const Color(0x44000000),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PickPage(r),
              ),
            );
          },
          // onLongPress: () => showDialog(
          //   context: context,
          //   builder: (BuildContext context) => _successDialog(context),
          // ),
        );
      },
    );

    return ListView(
      children: ListTile.divideTiles(context: context, tiles: tiles).toList(),
    );
  }

  void _navigateToAddRandomListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddListPage(),
      ),
    );
  }

  // Widget _successDialog(BuildContext context) {
  //   return Dialog(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(4),
  //     ),
  //     elevation: 0.0,
  //     backgroundColor: Colors.transparent,
  //     child: Container(
  //       padding: EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         shape: BoxShape.rectangle,
  //         borderRadius: BorderRadius.circular(4),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black12,
  //             blurRadius: 10.0,
  //             offset: const Offset(0.0, 10.0),
  //           ),
  //         ],
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           ListTile(
  //             dense: true,
  //             onTap: () => Navigator.pop(context),
  //             leading: Icon(
  //               FlatIcons.edit,
  //               color: Colors.brown,
  //               size: 14,
  //             ),
  //             title: Text(
  //               'Edit list',
  //             ),
  //           ),
  //           ListTile(
  //             dense: true,
  //             onTap: () => Navigator.pop(context),
  //             leading: Icon(
  //               FlatIcons.trash,
  //               color: Colors.red,
  //               size: 14,
  //             ),
  //             title: Text(
  //               'Delete list',
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
