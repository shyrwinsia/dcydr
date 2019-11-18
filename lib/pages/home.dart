import 'package:dcydr/bloc/homepage/bloc.dart';
import 'package:dcydr/bloc/homepage/event.dart';
import 'package:dcydr/bloc/homepage/state.dart';
import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/data/types.dart';
import 'package:dcydr/pages/addlist.dart';
import 'package:dcydr/pages/pick.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = HomePageBloc();
    _bloc.add(LoadLists());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Dcydr',
          actions: <Widget>[
            IconButton(
              iconSize: 18,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddListPage(),
                ),
              ),
              icon: Icon(
                FlatIcons.add_3,
              ),
            )
          ],
        ),
        body: _blocBuilder(context));
  }

  Widget _blocBuilder(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(const Color(0xff13b6cb)),
            ),
          );
        } else if (state is Success) {
          return _buildListView(context, state.list);
        } else if (state is Failed) {
          return Center(
            child: Text(state.message),
          );
        }
      },
    );
  }

  Widget _buildListView(BuildContext context, List<RandomList> list) {
    if (list.length > 0) {
      return ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: list.map(
            (item) {
              return ListTile(
                leading: item.icon,
                title: Text(
                  item.name,
                ),
                trailing: Icon(
                  FlatIcons.con_right_arrow_1_a,
                  color: const Color(0x44000000),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PickPage(item),
                    ),
                  );
                },
              );
            },
          ),
        ).toList(),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "You don't have any list. ಠ_ಠ",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          FlatButton.icon(
            padding: EdgeInsets.all(16),
            icon: Icon(
              FlatIcons.add_3,
              size: 12,
            ),
            textColor: Theme.of(context).accentColor,
            label: Text('Create list'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddListPage(),
              ),
            ),
          )
        ],
      );
    }
  }
}
