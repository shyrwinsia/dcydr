import 'package:dcydr/bloc/addlistpage/bloc.dart';
import 'package:dcydr/bloc/addlistpage/event.dart';
import 'package:dcydr/bloc/addlistpage/state.dart';
import 'package:dcydr/components/appbar.dart';
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
  final itemTextController = TextEditingController();
  final titleTextController = TextEditingController();
  AddListPageBloc _pageBloc;

  @override
  Widget build(BuildContext context) {
    _pageBloc = BlocProvider.of<AddListPageBloc>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Build new list",
        hasBackButton: true,
        actions: <Widget>[
          FlatButton(
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
          ),
        ],
      ),
      body: BlocBuilder<AddListPageBloc, AddListPageState>(
        bloc: _pageBloc,
        builder: (context, state) {
          if (state is Saving)
            return _buildLoading();
          else if (state is Saved) {
            // TODO Bad Future
            WidgetsBinding.instance
                .addPostFrameCallback((_) => Navigator.pop(context));
            return Container();
          } else
            return _buildBody();
        },
      ),
    );
  }

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
                  icon: RandomList.iconFromType(this.icon),
                ),
              ),
              Flexible(
                child: TextField(
                  controller: titleTextController,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add title',
                    contentPadding: EdgeInsets.all(16),
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
          Column(
            children: _buildItemList(),
          ),
          SizedBox(
            height: 18,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: const Color(0x142A86CB),
              textColor: const Color(0xFF2A86CB),
              padding: EdgeInsets.all(12),
              child: Text('Add item'),
              onPressed: () {
                FocusScope.of(context).unfocus();
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildAddItemDialog(),
                );
              },
            ),
          ),
        ],
      );

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    itemTextController.dispose();
    titleTextController.dispose();
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

  Widget _buildAddItemDialog() => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 40,
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
              TextField(
                autofocus: true,
                controller: itemTextController,
                onEditingComplete: () {
                  setState(() {
                    items.add(RandomListItem.withName(itemTextController.text));
                    itemTextController.text = '';
                  });
                  Navigator.pop(context);
                },
                style: TextStyle(
                  fontSize: 18,
                ),
                decoration: InputDecoration.collapsed(
                  hintText: 'Item name',
                ),
              ),
              Divider(
                color: const Color(0xFF2A86CB),
                height: 0,
              ),
              SizedBox(height: 18),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: const Color(0x142A86CB),
                  textColor: const Color(0xFF2A86CB),
                  padding: EdgeInsets.all(12),
                  child: Text('Add'),
                  onPressed: () {
                    setState(() {
                      items.add(
                          RandomListItem.withName(itemTextController.text));
                      itemTextController.text = '';
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );

  _buildItemList() {
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

  Widget _buildLoading() => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff13b6cb)),
        ),
      );
}
