import 'dart:math';
import 'package:choosr/data/types.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RandomListsWidget extends StatefulWidget {
  final RandomList _list;

  RandomListsWidget(this._list);

  @override
  _RandomListsWidgetState createState() => _RandomListsWidgetState();
}

class _RandomListsWidgetState extends State<RandomListsWidget> {
  String _pick = "";
  // Queue _pastPick = new Queue();
  var rng = Random();

  @override
  void initState() {
    super.initState();
    // _randomListBloc = BlocProvider.of<RandomListBloc>(context);
  }

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
              ? _pick = items.elementAt(rng.nextInt(items.length)).name
              : _pick = "Can't randomly pick from only one choice\n¯\\_(ツ)_/¯"
          : _pick = "Nothing to pick (◔_◔)";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._list.getName()),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.solidEdit),
              onPressed: _moveToListPage),
          IconButton(
            icon: Icon(FontAwesomeIcons.trash),
            onPressed: () {
              // _randomListBloc.dispatch(DeleteRandomList(this.widget._list));
              Navigator.of(context).pop();
            },
          ),
          IconButton(
              icon: Icon(FontAwesomeIcons.list), onPressed: _moveToListPage),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeIn(
              child: Text(
                _pick == ""
                    ? "Press button to choose from " + widget._list.getName()
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
  _CustomSwitchTileState createState() => new _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        widget._item.name,
        style: TextStyle(fontSize: 18.0),
      ),
      value: widget._item.selected,
      onChanged: (value) => {
        setState(() {
          widget._item.selected = value;
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
