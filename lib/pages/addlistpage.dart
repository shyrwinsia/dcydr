import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new list'),
      ),
      body: _createForm(),
    );
  }

  Widget _createForm() {
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
                  child: Icon(
                    FontAwesomeIcons.clipboardList,
                    color: Colors.black38,
                  ),
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        padding: EdgeInsets.all(8),
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
                            _createCategoryInkwell(
                              'Generic',
                              FontAwesomeIcons.clipboardList,
                              Colors.black38,
                            ),
                            _createCategoryInkwell('People',
                                FontAwesomeIcons.userAlt, Colors.lightBlue),
                            _createCategoryInkwell(
                              'Objects',
                              FontAwesomeIcons.box,
                              Colors.brown,
                            ),
                            _createCategoryInkwell(
                              'Places',
                              FontAwesomeIcons.mapMarker,
                              Colors.red,
                            ),
                            _createCategoryInkwell(
                              'Food',
                              FontAwesomeIcons.utensils,
                              Colors.green,
                            ),
                            _createCategoryInkwell(
                              'Animals',
                              FontAwesomeIcons.cat,
                              Colors.orange,
                            ),
                            _createCategoryInkwell(
                              'Music',
                              FontAwesomeIcons.music,
                              Colors.purple,
                            ),
                            _createCategoryInkwell(
                              'Games',
                              FontAwesomeIcons.gamepad,
                              Colors.indigo,
                            ),
                            _createCategoryInkwell(
                              'Activities',
                              FontAwesomeIcons.running,
                              Colors.deepPurple,
                            ),
                            _createCategoryInkwell(
                              'Transporation',
                              FontAwesomeIcons.rocket,
                              Colors.deepOrange,
                            ),
                            _createCategoryInkwell(
                              'Random',
                              FontAwesomeIcons.diceFive,
                              Colors.blueGrey,
                            ),
                          ],
                        ),
                      ),
                    );
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

  Widget _createCategoryInkwell(
    String category,
    IconData iconData,
    Color color,
  ) {
    return InkWell(
      onTap: () {},
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
}
