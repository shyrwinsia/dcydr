import 'package:flutter/material.dart';

class AddListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  String _icon;
  List<String> _colors = ["Red"];

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
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Name',
          ),
        ),
        FormField(
          builder: (FormFieldState state) {
            return InputDecorator(
              decoration: InputDecoration(
                labelText: 'Icon',
              ),
              isEmpty: _icon == '',
              child: new DropdownButtonHideUnderline(
                child: new DropdownButton(
                  value: _icon,
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(() {
                      _icon = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: _colors.map((String value) {
                    return new DropdownMenuItem(
                      value: value,
                      child: new Text(value),
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
