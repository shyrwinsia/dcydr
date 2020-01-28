import 'package:dcydr/components/custombutton.dart';
import 'package:dcydr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class AddItemDialog extends StatefulWidget {
  final List<RandomListItem> items;

  AddItemDialog({this.items});
  @override
  State<StatefulWidget> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  bool _isAddAllowed = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Add item',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              _buildItemNameTextField(),
              Divider(
                color: const Color(0xFF2A86CB),
                height: 0,
              ),
              SizedBox(height: 18),
              Align(
                alignment: Alignment.bottomRight,
                child: _buildAddButton(),
              ),
            ],
          ),
        ),
      );

  Widget _buildItemNameTextField() => TextField(
        autofocus: true,
        controller: this.controller,
        onEditingComplete: _addItemToList,
        onChanged: (text) {
          setState(() {
            if (controller.text.length > 0)
              this._isAddAllowed = true;
            else
              this._isAddAllowed = false;
          });
        },
        decoration: InputDecoration.collapsed(hintText: 'Enter item name'),
      );

  Widget _buildAddButton() => _isAddAllowed
      ? CustomFlatIconButton(
          label: 'Add',
          icon: FlatIcons.add,
          callback: _addItemToList,
        )
      : CustomFlatIconButton(
          label: 'Add',
          icon: FlatIcons.add,
          callback: null,
        );

  dynamic _addItemToList() {
    if (controller.text.length > 0) {
      widget.items.add(RandomListItem.withName(controller.text));
      controller.text = '';
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }
}
