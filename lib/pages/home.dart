import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

enum RandomListActions { EDIT, DELETE }

class _HomePageState extends State<HomePage> {
  // RandomListBloc _randomListBloc;

  @override
  void initState() {
    super.initState();
    //_randomListBloc = BlocProvider.of<RandomListBloc>(context);
    //_randomListBloc.dispatch(LoadRandomList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Choosr"),
      ),
      body: _buildRandomListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        //_randomListBloc.dispatch(AddRandomList()),
        tooltip: 'Add new list',
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }

  Widget _buildRandomListWidget() {
    return Text('hey');
    // return BlocBuilder(
    //   bloc: _randomListBloc,
    //   builder: (BuildContext context, RandomListState state) {
    //     if (state is RandomListLoading) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (state is RandomListLoaded) {
    //       return ListView.separated(
    //         separatorBuilder: (context, index) => Divider(),
    //         itemCount: state.randomList.length,
    //         itemBuilder: (context, index) {
    //           final displayRandomList = state.randomList[index];
    //           return ListTile(
    //             leading: displayRandomList.getIcon(),
    //             title: Text(
    //               displayRandomList.getName(),
    //               style: TextStyle(fontSize: 18.0),
    //             ),
    //             trailing: _renderMenuButton(displayRandomList),
    //             onTap: () {
    //               _moveToListPage(displayRandomList);
    //             },
    //           );
    //         },
    //       );
    //     }
    //   },
    // );
  }

  // Widget _renderMenuButton(RandomList randomList) {
  //   return PopupMenuButton<RandomListActions>(
  //     onSelected: (RandomListActions result) {
  //       if (result == RandomListActions.DELETE) {
  //         _randomListBloc.dispatch(DeleteRandomList(randomList));
  //       } else if (result == RandomListActions.EDIT) {
  //         _randomListBloc.dispatch(UpdateRandomList(randomList));
  //       } else {
  //         Error();
  //       }
  //     },
  //     itemBuilder: (BuildContext context) =>
  //         <PopupMenuEntry<RandomListActions>>[
  //       const PopupMenuItem<RandomListActions>(
  //         value: RandomListActions.EDIT,
  //         child: Text('Edit'),
  //       ),
  //       const PopupMenuItem<RandomListActions>(
  //         value: RandomListActions.DELETE,
  //         child: Text('Delete'),
  //       ),
  //     ],
  //   );
  // }
  // void _moveToListPage(list) {
  //   Navigator.of(context)
  //       .push(new MaterialPageRoute(
  //           builder: (context) => new RandomListsWidget(list)))
  //       .then((onValue) {
  //     _randomListBloc.dispatch(LoadRandomList());
  //   });
  // }
}
