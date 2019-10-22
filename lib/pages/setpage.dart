import 'package:choosr/components/appbar.dart';
import 'package:choosr/components/switchtile.dart';
import 'package:choosr/data/types.dart';
import 'package:flutter/material.dart';

class SetPage extends StatelessWidget {
  final RandomList list;

  SetPage({this.list});

  @override
  Widget build(BuildContext context) {
    final Iterable<CustomSwitchTile> tiles = list.items.map(
      (RandomListItem item) {
        return CustomSwitchTile(item);
      },
    );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: ChoosrAppBar(
        title: list.name + ' choices',
        hasBackButton: true,
      ),
      body: ListView(children: divided),
    );
  }
}
