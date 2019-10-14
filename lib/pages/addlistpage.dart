import 'package:choosr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AddListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  String _type = 'generic';
  List _items = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: const Color(0xff13b6cb),
        backgroundColorEnd: const Color(0xff2a86cb),
        centerTitle: true,
        title: Text("Create list"),
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
      padding: EdgeInsets.all(24),
      children: <Widget>[
        Row(
          children: <Widget>[
            InkWell(
              child: Card(
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: RandomList.iconFromType(_type),
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildCategoryDialog();
                  },
                );
              },
            ),
            SizedBox(
              width: 12,
            ),
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter list name',
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildListItems(),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton.icon(
          icon: Icon(
            FlatIcons.add,
            size: 12,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return _buildAddItemDialog();
              },
            );
          },
          label: Text('Add list item'),
        )
      ],
    );
  }

  Widget _buildCategoryInkwell(RandomListType type) {
    return InkWell(
      onTap: () {
        setState(() {
          _type = type.name;
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              type.icon,
              size: 18,
              color: type.color,
            ),
            SizedBox(
              width: 18,
            ),
            Text(
              type.name,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryDialog() {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Choose a category',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              children: RandomListTypes.types
                  .map(
                    (type) => _buildCategoryInkwell(type),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddItemDialog() {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add list item',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TextField(
              controller: addItemTextController,
              decoration: InputDecoration(
                hintText: 'Enter item name',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    addItemTextController.text = '';
                    Navigator.pop(context);
                  },
                ),
                RaisedButton(
                  child: Text('Add'),
                  onPressed: () => setState(
                    () {
                      _items.add(addItemTextController.text);
                      addItemTextController.text = '';
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildListItems() {
    return _items
        .map(
          (f) => Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(f),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _items.remove(f);
                      });
                    },
                    icon: Icon(
                      FlatIcons.trash,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  final addItemTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    addItemTextController.dispose();
    super.dispose();
  }
}
