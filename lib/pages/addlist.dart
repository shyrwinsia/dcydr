import 'package:dcydr/bloc/addlistpage/bloc.dart';
import 'package:dcydr/bloc/addlistpage/event.dart';
import 'package:dcydr/bloc/addlistpage/state.dart';
import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/custombutton.dart';
import 'package:dcydr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        padding: EdgeInsets.all(0),
        children: <Widget>[
          _buildListMetaInfo(),
          Divider(color: const Color(0x22000000), height: 0),
          Column(children: _buildItemList()),
          SizedBox(height: 16),
          _buildAddItemButton(),
          SizedBox(height: 16),
        ],
      );

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleTextController.dispose();
    super.dispose();
  }

  Widget _buildSaveButton() => _isSaveAllowed
      ? IconButton(
          iconSize: 18,
          onPressed: () => _pageBloc.add(
            SaveList(
              list: RandomList(
                  name: titleTextController.text,
                  type: this.icon,
                  items: this.items),
            ),
          ),
          icon: Icon(
            FlatIcons.save,
          ),
        )
      : IconButton(
          iconSize: 18,
          onPressed: null,
          icon: Icon(
            FlatIcons.save,
            color: const Color(0x66FFFFFF),
          ),
        );

  Widget _buildListMetaInfo() => ListTile(
        leading: RandomList.iconFromType(this.icon),
        title: TextField(
          onChanged: (text) {
            setState(() {
              if (text.length > 0)
                this._isSaveAllowed = true;
              else
                this._isSaveAllowed = false;
            });
          },
          controller: titleTextController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter list name',
          ),
        ),
        trailing: IconButton(
          iconSize: 16,
          padding: EdgeInsets.all(0),
          alignment: Alignment.centerRight,
          icon: Icon(
            FlatIcons.more,
            color: const Color(0xFF2A86CB),
          ), // TOTO doble loading
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => _buildCategoryDialog(),
          ),
        ),
      );

  Widget _buildAddItemButton() => Align(
        alignment: Alignment.bottomCenter,
        child: CustomFlatIconButton(
          label: 'Add item',
          icon: FlatIcons.add,
          callback: () {
            FocusScope.of(context).unfocus();
            showDialog(
              context: context,
              builder: (BuildContext context) => AddItemDialog(items: items),
              // force a refresh after pop
            ).then((onValue) => setState(() {}));
          },
        ),
      );

  Widget _buildCategoryDialog() => Dialog(
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
          ),
        ),
      );

  dynamic _buildItemList() {
    return this.items.map((f) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 4, 0, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  f.name,
                ),
                IconButton(
                  iconSize: 14,
                  onPressed: () {
                    setState(() {
                      this.items.remove(f);
                    });
                  },
                  icon: Icon(
                    FlatIcons.trash,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: const Color(0x11000000), height: 0),
        ],
      );
    }).toList();
  }
}

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
