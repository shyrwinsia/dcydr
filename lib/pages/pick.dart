import 'package:dcydr/bloc/pickpage/bloc.dart';
import 'package:dcydr/bloc/pickpage/event.dart';
import 'package:dcydr/bloc/pickpage/state.dart';
import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/fade.dart';
import 'package:dcydr/data/dao.dart';
import 'package:dcydr/data/types.dart';
import 'package:dcydr/pages/editlist.dart';
import 'package:dcydr/pages/set.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickPage extends StatefulWidget {
  final RandomList _list;
  PickPage(this._list);
  @override
  _PickPageState createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {
  PickPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = PickPageBloc();
  }

  void _moveToListPage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => SetPage(list: widget._list),
      ),
    );
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
              child: _blocBuilder(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _blocBuilder(BuildContext context) {
    return BlocBuilder<PickPageBloc, PickPageState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is PickedItemState) {
          return InkWell(
            onTap: () => _bloc.add(
              PickItem(items: this.widget._list.items),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  state.pick,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.display2,
                ),
              ),
            ),
          );
        } else {
          return InkWell(
            onTap: () => _bloc.add(
              PickItem(items: this.widget._list.items),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  'Tap to choose from ' + widget._list.name,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }
      },
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
            RandomListDao()
                .delete(widget._list)
                .then((onValue) => Navigator.of(context)..pop()..pop());
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
