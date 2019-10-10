import 'package:choosr/data/types.dart';
import 'package:choosr/pages/addlistpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  final List _list = List<RandomList>();

  HomePage() {
    _list
      ..add(RandomList(
        id: 2,
        name: 'Teammates',
        type: 'person',
        items: <RandomListItem>[
          RandomListItem(name: 'FQ'),
        ],
      ))
      ..add(RandomList(
        id: 2,
        name: 'Dice',
        type: 'random',
        items: <RandomListItem>[
          RandomListItem(name: 'FQ'),
        ],
      ))
      ..add(RandomList(
        id: 2,
        name: 'Hand',
        type: 'game',
        items: <RandomListItem>[
          RandomListItem(name: 'FQ'),
        ],
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Choosr"),
      ),
      body: _createList(_list, context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddRandomListPage(context),
        tooltip: 'Add new list',
        child: Icon(FontAwesomeIcons.plus),
      ),
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
