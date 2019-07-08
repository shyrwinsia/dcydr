import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Choosr/bloc/bloc.dart';
import 'package:Choosr/data/types.dart';
import 'package:Choosr/pages/list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RandomList> _lists = new List();
  RandomListBloc _randomListBloc;

  @override
  void initState() {
   super.initState();
   _randomListBloc = BlocProvider.of<RandomListBloc>(context);
   _randomListBloc.dispatch(LoadRandomList());
  }

  _HomePageState();

  void _moveToListPage(list) {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) => new RandomListsWidget(list)));
  }

  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = _lists.map(
      (list) {
        return ListTile(
          leading: list.getIcon(),
          title: Text(list.getName(), style: TextStyle(fontSize: 18.0)),
          onTap: () => _moveToListPage(list),
        );
      },
    );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Choosr"),
      ),
      body: ListView(children: divided),
      floatingActionButton: FloatingActionButton(
        onPressed: () { _randomListBloc.dispatch() },
        tooltip: 'Add new list',
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }

// TODO Clean this code
// move the list to the front page
// RandomList _dice = new RandomList("Die Roll", IconType.Random);
// _dice.add(RandomListItem("1"));
// _dice.add(RandomListItem("2"));
// _dice.add(RandomListItem("3"));
// _dice.add(RandomListItem("4"));
// _dice.add(RandomListItem("5"));
// _dice.add(RandomListItem("6"));
// _lists.add(_dice);

// RandomList _generic = new RandomList("Coin Flip", IconType.Random);
// _generic.add(RandomListItem("Head"));
// _generic.add(RandomListItem("Tail"));
// _lists.add(_generic);

// RandomList _rps = new RandomList("Rock-Paper-Scissors", IconType.Game);
// _rps.add(RandomListItem("Rock"));
// _rps.add(RandomListItem("Paper"));
// _rps.add(RandomListItem("Scissors"));
// _lists.add(_rps);

// _lists.add(new RandomList("Favorite Food", IconType.Food));
// _lists.add(new RandomList("Next pet", IconType.Animal));
// _lists.add(new RandomList("Playlists", IconType.Music));
// _lists.add(new RandomList("Stuff", IconType.Object));
// _lists.add(new RandomList("Hobbies", IconType.Activity));

// RandomList _transport =
// new RandomList("Transportation", IconType.Transport);
// _transport.add(RandomListItem("Walk"));
// _transport.add(RandomListItem("Bus"));
// _transport.add(RandomListItem("Train"));
// _lists.add(_transport);

// RandomList _placesToEat = new RandomList("Where to eat", IconType.Place);
// _placesToEat.add(RandomListItem("Slave Food"));
// _placesToEat.add(RandomListItem("Korean one-North"));
// _placesToEat.add(RandomListItem("Koufu one-North"));
// _placesToEat.add(RandomListItem("Subway one-North"));
// _placesToEat.add(RandomListItem("Bismillah Biryani"));
// _placesToEat.add(RandomListItem("Arkadaş Cafe"));
// _placesToEat.add(RandomListItem("Burger King Vivo"));
// _placesToEat.add(RandomListItem("Kopitiam Vivo"));
// _placesToEat.add(RandomListItem("Texas Vivo"));
// _placesToEat.add(RandomListItem("Stuff'd Vivo"));
// _placesToEat.add(RandomListItem("Segar Buona Vista"));
// _placesToEat.add(RandomListItem("Korean Bouna Vista"));
// _placesToEat.add(RandomListItem("Texas Bouna Vista"));
// _placesToEat.add(RandomListItem("Burger King NUH"));
// _placesToEat.add(RandomListItem("Hawker NUH"));
// _placesToEat.add(RandomListItem("Kopitiam NUH"));
// _placesToEat.add(RandomListItem("Al Amaan"));
// _lists.add(_placesToEat);

// RandomList _people = new RandomList("Team Members", IconType.Person);
// _people.add(RandomListItem("Steel"));
// _people.add(RandomListItem("Dean"));
// _people.add(RandomListItem("Mervyn"));
// _people.add(RandomListItem("Fu Qiang"));
// _people.add(RandomListItem("KK"));
// _people.add(RandomListItem("Peter"));
// _lists.add(_people);

// RandomList _scrum = new RandomList("Story Points", IconType.Generic);
// _scrum.add(RandomListItem("0.5"));
// _scrum.add(RandomListItem("1"));
// _scrum.add(RandomListItem("2"));
// _scrum.add(RandomListItem("3"));
// _scrum.add(RandomListItem("5"));
// _scrum.add(RandomListItem("8"));
// _scrum.add(RandomListItem("13"));
// _scrum.add(RandomListItem("20"));
// _lists.add(_scrum);
