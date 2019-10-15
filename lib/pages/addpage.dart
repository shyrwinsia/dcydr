import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AddListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
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
        TextField(
          style: TextStyle(fontSize: 24),
          decoration: new InputDecoration(
            contentPadding: EdgeInsets.all(16),
            hintText: 'Enter name',
          ),
        ),
        SizedBox(height: 24),
        TextField(
          decoration: new InputDecoration(
            hintText: 'Enter item',
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: <Widget>[
            Text('Hey'),
          ],
        ),
        Text('Hey'),
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
}
