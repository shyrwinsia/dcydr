import 'package:flutter/material.dart';
import 'package:RandoomPickr/types.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class RandomListsWidget extends StatefulWidget {
  RandomList _list;

  RandomListsWidget(this._list);

  @override
  _RandomListsWidgetState createState() => _RandomListsWidgetState();
}

class _RandomListsWidgetState extends State<RandomListsWidget> {
  String _pick = "";
  var _opacity = 0.0;
  var rng = Random();

  void _moveToListPage() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      List<RandomListItem> _items = widget._list.getItems();

      final Iterable<CustomSwitchTile> tiles = _items.map(
        (RandomListItem item) {
          return CustomSwitchTile(item);
        },
      );

      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text(widget._list.getName() + ' choices'),
        ),
        body: ListView(children: divided),
      );
    }));
  }

  _pickAnItem() {
    List<RandomListItem> items = widget._list.getActiveItems();
    // TODO Store old picks up to 2 so it will not keep repeating
    setState(() {
      items.length > 0
          ? items.length > 1
              ? _pick = items.elementAt(rng.nextInt(items.length)).getName()
              : _pick = "Cant pick from only one choice\n¯\\_(ツ)_/¯"
          : _pick = "Nothing to pick (◔_◔)";
      _opacity = _opacity == 0.0 ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._list.getName()),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _moveToListPage),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: _opacity,
              child: Text(
                _pick == ""
                    ? "Press button to randoomly pick from " +
                        widget._list.getName()
                    : _pick,
                textAlign: TextAlign.center,
                style:
                    _pick == "" ? null : Theme.of(context).textTheme.display3,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickAnItem,
        tooltip: 'Pick',
        child: Icon(FontAwesomeIcons.diceD20),
      ),
    );
  }
}

class CustomSwitchTile extends StatefulWidget {
  RandomListItem _item;

  CustomSwitchTile(this._item);

  @override
  _CustomSwitchTileState createState() => new _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  bool _v = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        widget._item.getName(),
        style: TextStyle(fontSize: 18.0),
      ),
      value: widget._item.isSelected(),
      onChanged: (value) => {
            setState(() {
              _v = value;
              widget._item.setSelected(value);
            })
          },
    );
  }
}
