import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  String _icon;
  List<String> _icons = ["Places"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add List'),
      ),
      body: _createForm(),
    );
  }

  Widget _createForm() {
    return ListView(
      padding: EdgeInsets.all(8),
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Title',
          ),
        ),
        FormField(
          builder: (FormFieldState state) {
            return InputDecorator(
              decoration: InputDecoration(
                labelText: 'Type',
              ),
              isEmpty: _icon == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _icon,
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(() {
                      _icon = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: _icons.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mapMarker,
                            color: Colors.red,
                          ),
                          SizedBox(width: 16),
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
