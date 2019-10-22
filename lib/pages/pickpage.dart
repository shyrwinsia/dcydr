import 'dart:math';
import 'package:choosr/components/appbar.dart';
import 'package:choosr/components/fade.dart';
import 'package:choosr/data/types.dart';
import 'package:choosr/pages/setpage.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class PickPage extends StatefulWidget {
  final RandomList _list;

  PickPage(this._list);

  @override
  _PickPageState createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {
  String _pick = "";
  var rng = Random();

  @override
  void initState() {
    super.initState();
  }

  void _moveToListPage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => SetPage(list: widget._list),
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
      appBar: ChoosrAppBar(
        title: widget._list.name,
        hasBackButton: true,
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
                  child: Padding(
                    padding: EdgeInsets.all(40),
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
          ),
        ],
      ),
    );
  }
}

// class SelectedOption extends StatelessWidget {
//   RandomListPopupMenu choice;

//   SelectedOption({Key key, this.choice}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Icon(choice.icon, size: 140.0, color: Colors.white),
//             Text(
//               choice.title,
//               style: TextStyle(color: Colors.white, fontSize: 30),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// List<RandomListPopupMenu> choices = <RandomListPopupMenu>[
//   RandomListPopupMenu(title: 'Edit', icon: FlatIcons.edit),
//   RandomListPopupMenu(title: 'Delete', icon: FlatIcons.trash),
// ];

// class RandomListPopupMenu {
//   final String title;
//   final IconData icon;

//   RandomListPopupMenu({
//     this.title,
//     this.icon,
//   });
// }

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
