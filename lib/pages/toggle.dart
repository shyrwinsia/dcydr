import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/customswitch.dart';
import 'package:dcydr/components/switchtile.dart';
import 'package:dcydr/data/dao.dart';
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
    _toggleSwitch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Iterable<CustomSwitchTile> tiles = this.items.map(
          (RandomListItem item) => CustomSwitchTile(
              list: widget.list,
              item: item,
              onChanged: (value) => _toggleSwitch()),
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
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: CustomSwitch(
                    value: this.toggleAll,
                    activeGradient: const LinearGradient(
                      colors: [
                        const Color(0xFFFFFFFF),
                        const Color(0xFFFFFFFF),
                      ],
                    ),
                    inactiveGradient: const LinearGradient(
                      colors: [
                        const Color(0xFFFFFFFF),
                        const Color(0xFFFFFFFF),
                      ],
                    ),
                    activeColor: const Color(0xFF2A86CB),
                    inactiveColor: const Color(0xFF2A86CB),
                    width: 33,
                    onChanged: (value) => _toggleItems(value),
                  ),
                ),
              ],
      ),
      body: ListView(children: divided),
    );
  }

  void _toggleSwitch() {
    // print('Toggle called ${value}');
    setState(
        () => this.toggleAll = items.fold(true, (v, e) => v && e.selected));
    print('Toggle called ${this.toggleAll}');
  }

  void _toggleItems(bool value) {
    setState(() {
      this.items.forEach((item) {
        item.selected = value;
      });
      this.toggleAll = value;
    });
    RandomListDao().update(this.widget.list);
  }
}
