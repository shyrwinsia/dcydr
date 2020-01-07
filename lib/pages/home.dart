import 'package:dcydr/bloc/homepage/bloc.dart';
import 'package:dcydr/bloc/homepage/event.dart';
import 'package:dcydr/bloc/homepage/state.dart';
import 'package:dcydr/bloc/router/bloc.dart';
import 'package:dcydr/bloc/router/event.dart';
import 'package:dcydr/components/appbar.dart';
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
              FlatIcons.add,
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
            return _buildListView(state.list);
          else
            return Container();
        },
      ),
    );
  }

  Widget _buildListView(List<RandomList> list) =>
      (list.isEmpty) ? _buildAddList() : _buildList(list);

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

  Widget _buildCreateButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton.icon(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: const Color(0x142A86CB),
            textColor: const Color(0xFF2A86CB),
            padding: EdgeInsets.all(16),
            icon: Icon(
              FlatIcons.add,
              size: 12,
            ),
            label: Text('Build new list'),
            onPressed: () => _routerBloc.add(MoveToAddPage()),
          )
        ],
      );

  Widget _buildList(List<RandomList> list) => ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: list.map(
            (item) => ListTile(
              leading: item.icon,
              title: Text(
                item.name,
              ),
              trailing: IconButton(
                iconSize: 18,
                padding: EdgeInsets.all(0),
                alignment: Alignment.centerRight,
                icon: Icon(
                  FlatIcons.more,
                  color: const Color(0x44000000),
                ), // TOTO doble loading
                onPressed: () {
                  RandomListDao()
                      .delete(item)
                      .then((e) => _pageBloc.add(Reinitialize()));
                }, // add bottomsheet here
              ),
              onTap: () => _routerBloc.add(MoveToPickPage(list: item)),
            ),
          ),
        ).toList(),
      );

  Widget _buildLoading() => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff13b6cb)),
        ),
      );
}
