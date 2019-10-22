import 'package:choosr/components/appbar.dart';
import 'package:choosr/data/sample.dart';
import 'package:choosr/data/types.dart';
import 'package:choosr/pages/addpage.dart';
import 'package:choosr/pages/pickpage.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  List _list;

  HomePage() {
    _list = SampleData().data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChoosrAppBar(
        title: 'Choosr',
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddListPage(),
              ),
            ),
            icon: Icon(
              FlatIcons.add_3,
              size: 18,
            ),
          )
        ],
      ),
      body: _createList(_list, context),
    );
  }

  Widget _createList(List<RandomList> list, BuildContext context) {
    final Iterable<ListTile> tiles = list.map(
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
    );

    return ListView(
      children: ListTile.divideTiles(context: context, tiles: tiles).toList(),
    );
  }
}

// Widget _successDialog(BuildContext context) {
//   return Dialog(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(4),
//     ),
//     elevation: 0.0,
//     backgroundColor: Colors.transparent,
//     child: Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.circular(4),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 10.0,
//             offset: const Offset(0.0, 10.0),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           ListTile(
//             dense: true,
//             onTap: () => Navigator.pop(context),
//             leading: Icon(
//               FlatIcons.edit,
//               color: Colors.brown,
//               size: 14,
//             ),
//             title: Text(
//               'Edit list',
//             ),
//           ),
//           ListTile(
//             dense: true,
//             onTap: () => Navigator.pop(context),
//             leading: Icon(
//               FlatIcons.trash,
//               color: Colors.red,
//               size: 14,
//             ),
//             title: Text(
//               'Delete list',
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
// GradientAppBar(
//         backgroundColorStart: const Color(0xff13b6cb),
//         backgroundColorEnd: const Color(0xff2a86cb),
//         centerTitle: true,
//         title: Text("Choosr"),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () => _navigateToAddRandomListPage(context),
//             icon: Icon(
//               FlatIcons.add_3,
//               size: 18,
//             ),
//           )
//         ],
//         elevation: 0,
//       ),
