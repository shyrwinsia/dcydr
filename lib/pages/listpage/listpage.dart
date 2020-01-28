import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/custombutton.dart';
import 'package:dcydr/data/types.dart';
import 'package:dcydr/pages/listpage/additemdialog.dart';
import 'package:dcydr/pages/listpage/chooseicondialog.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  final Function onSave;
  final RandomList list;

  ListPage({
    this.list,
    @required this.onSave,
  });

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String name;
  String icon;
  List<RandomListItem> items;

  TextEditingController titleTextController;
  bool isSaveAllowed;

  @override
  void initState() {
    super.initState();
    this.icon = this.widget.list?.type ?? 'generic';
    this.items = this.widget.list?.items ?? List();

    this.titleTextController = TextEditingController();
    this.titleTextController.text = this.widget.list?.name ?? '';
    this.isSaveAllowed = this.titleTextController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.list == null ? "Build new list" : "Edit list",
        hasBackButton: true,
        actions: <Widget>[
          _buildSaveButton(),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) => ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          _buildListMetaInfo(),
          Divider(color: const Color(0x44000000), height: 0),
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

  Widget _buildSaveButton() => isSaveAllowed
      ? IconButton(
          iconSize: 18,
          onPressed: () => this.widget.onSave(
                RandomList(
                    key: this.widget.list?.key,
                    name: titleTextController.text,
                    type: this.icon,
                    items: this.items),
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
                this.isSaveAllowed = true;
              else
                this.isSaveAllowed = false;
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
            builder: (BuildContext context) =>
                ChooseIconDialog(setIcon: setIcon),
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
          Divider(color: const Color(0x22000000), height: 0),
        ],
      );
    }).toList();
  }

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

  void setIcon(String icon) {
    setState(() => this.icon = icon);
  }
}
