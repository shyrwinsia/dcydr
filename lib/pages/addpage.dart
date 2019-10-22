import 'package:choosr/components/appbar.dart';
import 'package:choosr/data/types.dart';
import 'package:flutter/material.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';

class AddListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  List items = List();
  String _icon = 'generic';
  FocusNode _titleNode = FocusNode();

  bool _dialog = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChoosrAppBar(
        title: "Create list",
        hasBackButton: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              FlatIcons.save,
              size: 18,
            ),
          )
        ],
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return ListView(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Flexible(
              child: TextField(
                style: TextStyle(
                  fontSize: 24,
                ),
                autofocus: true,
                focusNode: _titleNode,
                onEditingComplete: () {
                  _addNewEntry();
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter list title',
                  contentPadding: EdgeInsets.fromLTRB(24, 16, 16, 16),
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(16),
              onPressed: () {
                setState(() {
                  _dialog = true;
                });
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildCategoryDialog();
                  },
                );
              },
              icon: RandomList.iconFromType(_icon),
            ),
          ],
        ),
        Divider(
          color: const Color(0x22000000),
          height: 0,
        ),
        SizedBox(
          height: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: _buildList(),
        ),
        FlatButton.icon(
          padding: EdgeInsets.all(16),
          icon: Icon(
            FlatIcons.plus,
            size: 10,
          ),
          textColor: Theme.of(context).accentColor,
          label: Text(
            'Add item',
          ),
          onPressed: () {
            _addNewEntry();
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  Widget _buildCategoryDialog() {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 40,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Text(
                'Choose an icon',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Wrap(
              children: RandomListTypes.types.map((f) {
                return IconButton(
                  padding: EdgeInsets.all(24),
                  icon: RandomList.iconFromType(f.name),
                  onPressed: () {
                    setState(() {
                      _icon = f.name;
                      _dialog = false;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  _buildList() {
    List rvalue = items.map(
      (f) {
        return Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                focusNode: f,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter item name',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                onEditingComplete: () {
                  _addNewEntry();
                },
              ),
            ),
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {
                setState(() {
                  items.remove(f);
                });
              },
              icon: Icon(
                FlatIcons.minus,
                size: 14,
                color: Theme.of(context).accentColor,
              ),
            )
          ],
        );
      },
    ).toList();
    if (items.length > 0 && !_dialog)
      FocusScope.of(context).requestFocus(items.last);
    else if (items.length == 0 && !_dialog)
      FocusScope.of(context).requestFocus(_titleNode);
    return rvalue;
  }

  void _addNewEntry() {
    setState(() {
      items.add(FocusNode());
    });
  }
}
