import 'package:dcydr/components/fade.dart';
import 'package:dcydr/data/dao.dart';
import 'package:dcydr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomSwitchTile extends StatefulWidget {
  final RandomListItem item;
  final RandomList list;

  CustomSwitchTile({this.list, this.item});

  @override
  _CustomSwitchTileState createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  @override
  Widget build(BuildContext context) => ListTile(
        title: widget.item.selected
            ? FadeIn(
                child: Text(widget.item.name), fromAlpha: 0.4, toAlpha: 1.0)
            : FadeOut(
                child: Text(
                  widget.item.name,
                ),
                fromAlpha: 1.0,
                toAlpha: 0.4,
              ),
        trailing: widget.item.selected
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
            widget.item.selected = !widget.item.selected;
            RandomListDao().update(this.widget.list);
          })
        },
      );
}
