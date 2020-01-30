import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/switchtile.dart';
import 'package:dcydr/data/dao.dart';
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
  List<RandomListItem> items;
  bool toggleAll;

  @override
  void initState() {
    this.items = widget.list.items;
    _toggleSwitch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Iterable<CustomSwitchTile> tiles = this.items.map(
          (RandomListItem item) => CustomSwitchTile(
              list: widget.list, item: item, callback: _toggleSwitch),
        );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Toggle choices',
        hasBackButton: true,
        actions: this.items.isEmpty
            ? null
            : <Widget>[
                IconButton(
                  padding: EdgeInsets.all(16),
                  icon: this.toggleAll
                      ? Icon(
                          FlatIcons.switch_1,
                          size: 22,
                        )
                      : Icon(
                          FlatIcons.switch_,
                          size: 22,
                        ),
                  onPressed: () => _toggleItems(),
                )
              ],
      ),
      body: ListView(children: divided),
    );
  }

  void _toggleSwitch() {
    setState(
        () => this.toggleAll = items.fold(true, (v, e) => v && e.selected));
  }

  void _toggleItems() {
    setState(() {
      this.toggleAll = !toggleAll;
      this.items.forEach((item) {
        print(item.selected);
        item.selected = this.toggleAll;
      });
    });
    RandomListDao().update(this.widget.list);
  }
}
