import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/data/dao.dart';
import 'package:dcydr/data/types.dart';
import 'package:dcydr/pages/addlist.dart';
import 'package:dcydr/pages/pick.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
        body: FutureBuilder<List<RandomList>>(
          future: RandomListDao().getAll(),
          builder:
              (BuildContext context, AsyncSnapshot<List<RandomList>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Text('Awaiting result...');
              case ConnectionState.done:
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                return _createList(snapshot.data, context);
            }
            return null;
          },
        ));
  }

  Widget _createList(List<RandomList> list, BuildContext context) {
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
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      );
    }
  }
}
