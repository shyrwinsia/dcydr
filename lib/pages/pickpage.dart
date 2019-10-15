import 'dart:math';
import 'package:choosr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class PickPage extends StatefulWidget {
  final RandomList _list;

  PickPage(this._list);

  @override
  _PickPageState createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {
  String _pick = "";
  // Queue _pastPick = new Queue();
  var rng = Random();

  @override
  void initState() {
    super.initState();
  }

  void _moveToListPage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          List<RandomListItem> _items = widget._list.items;

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
            appBar: GradientAppBar(
              backgroundColorStart: const Color(0xff13b6cb),
              backgroundColorEnd: const Color(0xff2a86cb),
              centerTitle: true,
              title: Text(widget._list.name + ' choices'),
              leading: IconButton(
                icon: Icon(
                  FlatIcons.con_left_arrow_1_a,
                  size: 18,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  _pickAnItem() {
    List<RandomListItem> items = widget._list.active;
    // TODO Store old picks up to 2 so it will not keep repeating
    setState(() {
      items.length > 0
          ? items.length > 1
              ? _pick = items.elementAt(rng.nextInt(items.length)).name
              : _pick = "Can't randomly pick from only one choice\n¯\\_(ツ)_/¯"
          : _pick = "Nothing to pick (◔_◔)";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: const Color(0xff13b6cb),
        backgroundColorEnd: const Color(0xff2a86cb),
        centerTitle: true,
        title: Text(widget._list.name),
        leading: IconButton(
          icon: Icon(
            FlatIcons.con_left_arrow_1_a,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FlatIcons.controls_4,
                size: 18,
              ),
              onPressed: _moveToListPage),
          IconButton(
            icon: Icon(
              FlatIcons.more_1,
              size: 18,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FadeIn(
              child: InkWell(
                onTap: _pickAnItem,
                child: Center(
                  child: Text(
                    _pick == ""
                        ? "Tap to choose from " + widget._list.name
                        : _pick,
                    textAlign: TextAlign.center,
                    style: _pick == ""
                        ? null
                        : Theme.of(context).textTheme.display2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FadeIn extends StatefulWidget {
  final Widget child;

  FadeIn({@required this.child});

  @override
  createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FadeIn oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

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
              FlatIcons.switch_1,
              color: const Color(0xff2a86cb),
              size: 28,
            )
          : Icon(
              FlatIcons.switch_,
              color: const Color(0x44000000),
              size: 28,
            ),
      onTap: () => {
        setState(() {
          widget._item.selected = !widget._item.selected;
        })
      },
    );
  }
}

// _pickAnItem() {
//   List<RandomListItem> items = widget._list.getActiveItems();
//   String _p;
//   var _ppLength;

//   if (items.length > 0) {
//     if (items.length > 1) {
//       _ppLength =
//           (items.length - _pastPick.length) > 3 ? 3 : items.length - 2;
//       if (_pastPick.length > 0) {
//         List _pastPickList = _pastPick.toList();
//         // realign past picks to the current pool
//         // past picks should be pool size - 2 or 3 whichever is higher

//         for (int i = 0; i < _ppLength; i++) _pastPick.removeFirst();

//         // remove all past picks
//         _pastPickList.forEach((i) {
//           items.removeWhere((it) => it.getName() == i.getName());
//         });
//       }

//       // pick
//       RandomListItem r = items.elementAt(rng.nextInt(items.length));

//       // dont make it go more than 3
//       // this prevents 3 consecutive picks
//       if (_pastPick.length > _ppLength) _pastPick.removeFirst();

//       // add to pick queue if there are more items than 3
//       if (_pastPick.length < items.length - 2) _pastPick.addLast(r);
//       _p = r.getName();
//     } else
//       _p = "Cant pick from only one choice\n¯\\_(ツ)_/¯";
//   } else {
//     _p = "Nothing to pick (◔_◔)";
//   }
//   setState(() {
//     _pick = _p;
//   });
// }
