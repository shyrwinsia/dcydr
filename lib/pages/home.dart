import 'package:dcydr/bloc/homepage/bloc.dart';
import 'package:dcydr/bloc/homepage/event.dart';
import 'package:dcydr/bloc/homepage/state.dart';
import 'package:dcydr/bloc/router/bloc.dart';
import 'package:dcydr/bloc/router/event.dart';
import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/components/custombutton.dart';
import 'package:dcydr/data/dao.dart';
import 'package:dcydr/data/types.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageBloc _pageBloc;
  RouterBloc _routerBloc;

  @override
  Widget build(BuildContext context) {
    _pageBloc = BlocProvider.of<HomePageBloc>(context);
    _routerBloc = BlocProvider.of<RouterBloc>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dcydr',
        actions: <Widget>[
          IconButton(
            iconSize: 18,
            onPressed: () => _routerBloc.add(MoveToAddPage()),
            icon: Icon(
              FlatIcons.add_2,
            ),
          )
        ],
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        bloc: _pageBloc,
        builder: (context, state) {
          if (state is Loading)
            return _buildLoading();
          else if (state is Loaded)
            return _buildListView(state.list, context);
          else
            return Container();
        },
      ),
    );
  }

  Widget _buildListView(List<RandomList> list, BuildContext context) =>
      (list.isEmpty) ? _buildAddList() : _buildList(list, context);

  Widget _buildAddList() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '🤔',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              color: const Color(0x66000000),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "You don't have any lists.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: const Color(0x66000000),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          _buildCreateButton(),
        ],
      );

  Widget _buildCreateButton() => Align(
        alignment: Alignment.bottomCenter,
        child: CustomFlatIconButton(
          icon: FlatIcons.add_2,
          label: 'Build new list',
          callback: () => _routerBloc.add(MoveToAddPage()),
        ),
      );

  Widget _buildList(List<RandomList> list, BuildContext context) => ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: list.map(
            (item) => ListTile(
              leading: item.icon,
              title: Text(
                item.name,
              ),
              trailing: IconButton(
                iconSize: 16,
                padding: EdgeInsets.all(0),
                alignment: Alignment.centerRight,
                icon: Icon(
                  FlatIcons.more,
                  color: const Color(0xFF2A86CB),
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildCategoryDialog(item),
                ),
              ),
              onTap: () => _routerBloc.add(MoveToPickPage(list: item)),
              onLongPress: () => showDialog(
                context: context,
                builder: (BuildContext context) => _buildCategoryDialog(item),
              ),
            ),
          ),
        ).toList(),
      );

  Widget _buildLoading() => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff13b6cb)),
        ),
      );

  Widget _buildCategoryDialog(RandomList list) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Container(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomFlatIconButton(
                    label: 'Edit list',
                    icon: FlatIcons.edit,
                    callback: () => _routerBloc.add(MoveToEditPage(list: list)),
                  ),
                  FlatButton.icon(
                    textColor: const Color(0xFF2A86CB),
                    highlightColor: const Color(0x11FF0000),
                    icon: Icon(
                      FlatIcons.trash,
                      size: 12,
                      color: Colors.red,
                    ),
                    label: Text(
                      'Delete list',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    onPressed: () => RandomListDao()
                        .delete(list)
                        .then((e) => _pageBloc.add(Reinitialize()))
                        .then((e) => Navigator.pop(context)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
