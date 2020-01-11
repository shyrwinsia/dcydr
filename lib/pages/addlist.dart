import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/data/sample.dart';
import 'package:dcydr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class AddListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  String icon = 'generic';
  List<RandomListItem> items;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CustomAppBar(
          title: "Build new list",
          hasBackButton: true,
          actions: <Widget>[
            FlatButton(
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => SampleData.instance.addDefaultData()),
          ],
        ),
        body: _buildBody(),
      );

  Widget _buildBody() => ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Ink(
                decoration: ShapeDecoration(
                  color: const Color(0x0F2A86CB),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _buildCategoryDialog(),
                    );
                  },
                  icon: RandomList.iconFromType(this.icon),
                ),
              ),
              Flexible(
                child: TextField(
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  autofocus: true,
                  // focusNode: _titleNode,
                  onEditingComplete: () {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add title',
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: const Color(0x22000000),
            height: 0,
          ),
          SizedBox(
            height: 8,
          ),
          FlatButton.icon(
            padding: EdgeInsets.all(16),
            icon: Icon(
              FlatIcons.plus,
              size: 12,
            ),
            textColor: Theme.of(context).accentColor,
            label: Text(
              'Add item',
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => _buildAddItemDialog(),
            ),
          ),
        ],
      );

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  Widget _buildCategoryDialog() => Dialog(
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
                      setState(() => icon = f.name);
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      );

  Widget _buildAddItemDialog() => Dialog(
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
                  'Add item',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
