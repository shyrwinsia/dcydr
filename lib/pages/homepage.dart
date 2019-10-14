import 'package:choosr/data/types.dart';
import 'package:choosr/pages/addlistpage.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class HomePage extends StatelessWidget {
  final List _list = List<RandomList>();

  HomePage() {
    _list
      ..add(RandomList(
        id: 2,
        name: 'Thingz to buy',
        type: 'tag',
        items: <RandomListItem>[
          RandomListItem(name: 'FQ'),
        ],
      ))
      ..add(RandomList(
        id: 2,
        name: 'Speaking notes',
        type: 'megaphone',
        items: <RandomListItem>[
          RandomListItem(name: 'FQ'),
        ],
      ))
      ..add(RandomList(
        id: 2,
        name: 'Shitty ideas',
        type: 'idea',
        items: <RandomListItem>[
          RandomListItem(name: 'FQ'),
        ],
      ))
      ..add(RandomList(
        id: 2,
        name: 'Lunch places',
        type: 'location',
        items: <RandomListItem>[
          RandomListItem(name: 'FQ'),
        ],
      ))
      ..add(RandomList(
        id: 2,
        name: 'Stupid things',
        type: 'star',
        items: <RandomListItem>[
          RandomListItem(name: 'FQ'),
        ],
      ))
      ..add(RandomList(
        id: 2,
        name: 'Whatever',
        type: 'diamond',
        items: <RandomListItem>[
          RandomListItem(name: 'FQ'),
        ],
      ))
      ..add(RandomList(
        id: 2,
        name: 'Generic list',
        type: 'list',
        items: <RandomListItem>[
          RandomListItem(name: 'FQ'),
        ],
      ))
      ..add(RandomList(
        id: 2,
        name: 'Team membahs',
        type: 'user',
        items: <RandomListItem>[
          RandomListItem(name: 'FQ'),
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
            size: 18,
            color: const Color(0x44000000),
          ),
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
}
