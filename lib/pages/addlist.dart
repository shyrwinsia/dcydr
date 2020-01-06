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
  // AddListPageBloc _bloc;
  @override
  void initState() {
    super.initState();
    // _bloc = AddListPageBloc();
  }

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
                  icon: RandomList.iconFromType('generic'),
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
                    hintText: 'Enter list title',
                    contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
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
            onPressed: () {
              // _addNewEntry();
            },
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
            ],
          ),
        ),
      );
}

class RandomListItemWidget extends StatefulWidget {
  final Function add;
  final Function remove;

  RandomListItemWidget({
    @required this.add,
    @required this.remove,
  });

  @override
  _RandomListItemWidgetState createState() => _RandomListItemWidgetState();
}

class _RandomListItemWidgetState extends State<RandomListItemWidget> {
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              focusNode: focusNode,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter item name',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
              onEditingComplete: () {
                widget.add();
                // _addNewEntry();
              },
            ),
          ),
          IconButton(
            iconSize: 14,
            padding: EdgeInsets.symmetric(horizontal: 16),
            onPressed: () {
              setState(() {
                widget.remove(widget);
                // items.remove(f);
              });
            },
            icon: Icon(
              FlatIcons.minus,
              color: Theme.of(context).accentColor,
            ),
          )
        ],
      );

  @override
  void dispose() =>
      // Clean up the controller when the widget is disposed.
      super.dispose();
}
