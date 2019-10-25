import 'dart:math';
import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/fade.dart';
import 'package:dcydr/data/types.dart';
import 'package:dcydr/pages/editlist.dart';
import 'package:dcydr/pages/set.dart';
import 'package:flutter/material.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';

class PickPage extends StatefulWidget {
  final RandomList _list;
  PickPage(this._list);
  @override
  _PickPageState createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {
  String _pick = '';
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
          : _pick = 'Nothing to pick (◔_◔)';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget._list.name,
        hasBackButton: true,
        actions: <Widget>[
          IconButton(
              iconSize: 18,
              icon: Icon(
                FlatIcons.controls_4,
              ),
              onPressed: _moveToListPage),
          PopupMenuButton<String>(
            icon: Icon(
              FlatIcons.more_1,
              size: 18,
            ),
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Actions.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
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
                      _pick == ''
                          ? 'Tap to choose from ' + widget._list.name
                          : _pick,
                      textAlign: TextAlign.center,
                      style: _pick == ''
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

  void choiceAction(String choice) {
    if (choice == Actions.EDIT) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditListPage(list: widget._list),
        ),
      );
    } else if (choice == Actions.DELETE) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return _buildDialog();
        },
      );
    }
  }

  Widget _buildDialog() {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(24, 32, 24, 16),
      content: Text('Delete this list?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            'Delete',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            // TODO Add the logic to delete here
            print('YES. DELETE');
            Navigator.of(context)..pop()..pop();
          },
        ),
      ],
    );
  }
}

class Actions {
  static const String EDIT = 'Edit';
  static const String DELETE = 'Delete';
  static const List<String> choices = <String>[EDIT, DELETE];
}
