import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/switchtile.dart';
import 'package:dcydr/data/types.dart';
import 'package:flutter/material.dart';

class TogglePage extends StatefulWidget {
  final RandomList list;

  TogglePage({this.list});

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  List<RandomListItem> items;
  bool toggleAll;

  @override
  void initState() {
    this.items = widget.list.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Iterable<CustomSwitchTile> tiles = this.items.map(
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
      ),
      body: ListView(children: divided),
    );
  }
}
