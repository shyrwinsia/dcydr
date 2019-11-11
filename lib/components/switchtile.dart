import 'package:dcydr/components/fade.dart';
import 'package:dcydr/data/types.dart';
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
      title: widget._item.selected
          ? FadeIn(child: Text(widget._item.name), from: 0.4, to: 1.0)
          : FadeOut(
              child: Text(
                widget._item.name,
              ),
              from: 1.0,
              to: 0.4,
            ),
      trailing: widget._item.selected
          ? FadeIn(
              child: Icon(
                FlatIcons.success,
                color: const Color(0xff2a86cb),
              ),
            )
          : FadeOut(
              child: Icon(
                FlatIcons.success,
                color: const Color(0xff2a86cb),
              ),
            ),
      onTap: () => {
        setState(() {
          widget._item.selected = !widget._item.selected;
        })
      },
    );
  }
}
