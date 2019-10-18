import 'package:choosr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AddListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  List _items = List();
  String _icon = 'generic';

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
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter list title',
                  contentPadding: EdgeInsets.all(24),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildCategoryDialog();
                  },
                );
              },
              icon: RandomList.iconFromType(_icon),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildList(),
        ),
        FlatButton.icon(
          padding: EdgeInsets.all(16),
          icon: Icon(
            FlatIcons.add,
            size: 10,
          ),
          label: Text('Add item'),
          onPressed: () {
            setState(() {
              _items.add('');
            });
          },
        ),
      ],
    );
  }

  final addItemTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    addItemTextController.dispose();
    super.dispose();
  }

  Widget _buildCategoryDialog() {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose an icon',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Wrap(
              children: RandomListTypes.types.map((f) {
                return IconButton(
                  padding: EdgeInsets.all(24),
                  icon: RandomList.iconFromType(f.name),
                  onPressed: () {
                    setState(() {
                      _icon = f.name;
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
    return _items.map(
      (f) {
        return Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter item name',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _items.remove(f);
                });
              },
              icon: Icon(
                FlatIcons.error,
                size: 18,
                color: const Color(0x66000000),
              ),
            )
          ],
        );
      },
    ).toList();
  }
}
