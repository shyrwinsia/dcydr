import 'package:choosr/data/types.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  String _category = 'generic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new list'),
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 24,
      ),
      children: <Widget>[
        Row(
          children: <Widget>[
            InkWell(
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: RandomList.iconFromType(_category),
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
          height: 24,
        ),
        RaisedButton.icon(
          icon: Icon(
            FontAwesomeIcons.plus,
            size: 12,
          ),
          onPressed: () {},
          label: Text('Add list item'),
        )
      ],
    );
  }

  Widget _buildCategoryInkwell(
    String category,
    IconData iconData,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        setState(() {
          _category = category.toLowerCase();
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 18,
              color: color,
            ),
            SizedBox(
              width: 18,
            ),
            Text(
              category,
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
              height: 16,
            ),
            _buildCategoryInkwell(
              'Generic',
              FontAwesomeIcons.clipboardList,
              Colors.black38,
            ),
            _buildCategoryInkwell(
              'People',
              FontAwesomeIcons.userAlt,
              Colors.lightBlue,
            ),
            _buildCategoryInkwell(
              'Objects',
              FontAwesomeIcons.box,
              Colors.brown,
            ),
            _buildCategoryInkwell(
              'Places',
              FontAwesomeIcons.mapMarker,
              Colors.red,
            ),
            _buildCategoryInkwell(
              'Food',
              FontAwesomeIcons.utensils,
              Colors.green,
            ),
            _buildCategoryInkwell(
              'Animals',
              FontAwesomeIcons.cat,
              Colors.orange,
            ),
            _buildCategoryInkwell(
              'Music',
              FontAwesomeIcons.music,
              Colors.purple,
            ),
            _buildCategoryInkwell(
              'Games',
              FontAwesomeIcons.gamepad,
              Colors.indigo,
            ),
            _buildCategoryInkwell(
              'Activities',
              FontAwesomeIcons.running,
              Colors.deepPurple,
            ),
            _buildCategoryInkwell(
              'Transporation',
              FontAwesomeIcons.rocket,
              Colors.deepOrange,
            ),
            _buildCategoryInkwell(
              'Random',
              FontAwesomeIcons.diceFive,
              Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
