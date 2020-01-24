import 'package:dcydr/bloc/addlistpage/bloc.dart';
import 'package:dcydr/bloc/addlistpage/event.dart';
import 'package:dcydr/bloc/addlistpage/state.dart';
import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/dialog.dart';
import 'package:dcydr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  String icon = 'generic';
  List<RandomListItem> items = List();
  bool _isSaveAllowed = false;
  final titleTextController = TextEditingController();
  AddListPageBloc _pageBloc;

  @override
  Widget build(BuildContext context) {
    _pageBloc = BlocProvider.of<AddListPageBloc>(context);
    return BlocListener<AddListPageBloc, AddListPageState>(
      bloc: _pageBloc,
      listener: (context, state) {
        if (state is Saved) Navigator.pop(context);
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Build new list",
          hasBackButton: true,
          actions: <Widget>[
            _buildSaveButton(),
          ],
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) => ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          _buildListMetaInfo(),
          SizedBox(height: 8),
          Divider(color: const Color(0x22000000), height: 0),
          SizedBox(height: 8),
          Column(children: _buildItemList()),
          SizedBox(height: 18),
          _buildAddItemButton(),
        ],
      );

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleTextController.dispose();
    super.dispose();
  }

  Widget _buildSaveButton() => _isSaveAllowed
      ? FlatButton(
          child: Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => _pageBloc.add(
            SaveList(
              list: RandomList(
                  name: titleTextController.text,
                  type: this.icon,
                  items: this.items),
            ),
          ),
        )
      : FlatButton(
          child: Text(
            'Save',
            style: TextStyle(color: Colors.white38),
          ),
          onPressed: null,
        );

  Widget _buildListMetaInfo() => Row(
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
              onChanged: (text) {
                setState(() {
                  if (text.length > 0)
                    this._isSaveAllowed = true;
                  else
                    this._isSaveAllowed = false;
                });
              },
              controller: titleTextController,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter list name',
                contentPadding: EdgeInsets.all(16),
              ),
            ),
          ),
        ],
      );

  Widget _buildAddItemButton() => Align(
        alignment: Alignment.bottomCenter,
        child: FlatButton.icon(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: const Color(0x142A86CB),
          textColor: const Color(0xFF2A86CB),
          padding: EdgeInsets.all(12),
          icon: Icon(
            FlatIcons.add,
            size: 12,
          ),
          label: Text('Add item'),
          onPressed: () {
            FocusScope.of(context).unfocus();
            showDialog(
              context: context,
              builder: (BuildContext context) =>
                  ExtendedCustomDialog(items: items),
              // force a refresh after pop
            ).then((onValue) => setState(() {}));
          },
        ),
      );

  Widget _buildCategoryDialog() => CustomDialog(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Text(
              'Choose an icon',
              style: TextStyle(
                fontSize: 18,
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
      );

  dynamic _buildItemList() {
    return this.items.map((f) {
      return Container(
        padding: EdgeInsets.only(left: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              f.name,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            IconButton(
              iconSize: 18,
              onPressed: () {
                setState(() {
                  this.items.remove(f);
                });
              },
              icon: Icon(
                FlatIcons.minus,
                color: const Color(0xff2a86cb),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}

class ExtendedCustomDialog extends StatefulWidget {
  final List<RandomListItem> items;

  ExtendedCustomDialog({this.items});
  @override
  State<StatefulWidget> createState() => ExtendedCustomDialogState();
}

class ExtendedCustomDialogState extends State<ExtendedCustomDialog> {
  bool _isAddAllowed = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => CustomDialog(
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
        style: TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration.collapsed(hintText: 'Enter item name'),
      );

  Widget _buildAddButton() => _isAddAllowed
      ? FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: const Color(0x142A86CB),
          textColor: const Color(0xFF2A86CB),
          padding: EdgeInsets.all(12),
          child: Text('Add'),
          onPressed: _addItemToList,
        )
      : FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: const Color(0x142A86CB),
          textColor: const Color(0x442A86CB),
          padding: EdgeInsets.all(12),
          child: Text('Add'),
          onPressed: null,
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
