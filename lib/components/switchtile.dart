import 'package:choosr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomSwitchTile extends StatefulWidget {
  final RandomListItem _item;

  CustomSwitchTile(this._item);

  @override
  _CustomSwitchTileState createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget._item.name,
        style: widget._item.selected
            ? null
            : TextStyle(
                color: const Color(0x44000000),
              ),
      ),
      trailing: widget._item.selected
          ? Icon(
              FlatIcons.success,
              color: const Color(0xff2a86cb),
            )
          : null,
      onTap: () => {
        setState(() {
          widget._item.selected = !widget._item.selected;
        })
      },
    );
  }
}
