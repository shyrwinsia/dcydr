import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/switchtile.dart';
import 'package:dcydr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class TogglePage extends StatefulWidget {
  final RandomList list;

  TogglePage({this.list});

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  @override
  Widget build(BuildContext context) {
    final Iterable<CustomSwitchTile> tiles = widget.list.items.map(
      (RandomListItem item) => CustomSwitchTile(
        list: widget.list,
        item: item,
      ),
    );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Toggle choices',
        hasBackButton: true,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(16),
            icon: Icon(
              FlatIcons.switch_,
              size: 22,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(children: divided),
    );
  }
}
