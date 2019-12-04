import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/switchtile.dart';
import 'package:dcydr/data/types.dart';
import 'package:flutter/material.dart';

class PickOptionsPage extends StatelessWidget {
  // TODO fix the problem that the disabled
  // ones are still updated in the pick page
  final RandomList list;

  PickOptionsPage({this.list});

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
      appBar: CustomAppBar(
        title: list.name + ' choices',
        hasBackButton: true,
      ),
      body: ListView(children: divided),
    );
  }
}
