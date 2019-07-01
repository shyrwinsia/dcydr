import 'package:flutter/material.dart';
import 'package:RandoomPickr/types.dart';
import 'package:RandoomPickr/pages/list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  TODO: populate the state from db
  List<RandomList> _lists = new List();

  _HomePageState() {
    _lists.add(new RandomList("Parks", IconType.Place));
    _lists.add(new RandomList("My board games", IconType.Object));
    _lists.add(new RandomList("Dinner options", IconType.Food));
    _lists.add(new RandomList("Next pet to buy", IconType.Animal));
    _lists.add(new RandomList("Songs to play in gigs", IconType.Music));
    _lists.add(new RandomList("Generic list", IconType.Generic));

    RandomList _placesToEat = new RandomList("Lunch", IconType.Food);
    _placesToEat.add(RandomListItem("Slave Food"));
    _placesToEat.add(RandomListItem("Korean one-North"));
    _placesToEat.add(RandomListItem("Koufu one-North"));
    _placesToEat.add(RandomListItem("Subway one-North"));
    _placesToEat.add(RandomListItem("Bismillah Biryani"));
    _placesToEat.add(RandomListItem("Arkadaş Cafe"));
    _placesToEat.add(RandomListItem("Burger King Vivo"));
    _placesToEat.add(RandomListItem("Kopitiam Vivo"));
    _placesToEat.add(RandomListItem("Texas Vivo"));
    _placesToEat.add(RandomListItem("Stuff'd Vivo"));
    _placesToEat.add(RandomListItem("Segar Buona Vista"));
    _placesToEat.add(RandomListItem("Korean Bouna Vista"));
    _placesToEat.add(RandomListItem("Texas Bouna Vista"));
    _placesToEat.add(RandomListItem("Burger King NUH"));
    _placesToEat.add(RandomListItem("Hawker NUH"));
    _placesToEat.add(RandomListItem("Kopitiam NUH"));
    _placesToEat.add(RandomListItem("Al Amaan"));
    _lists.add(_placesToEat);

    RandomList _people = new RandomList("Team Members", IconType.Person);
    _people.add(RandomListItem("Steel"));
    _people.add(RandomListItem("Dean"));
    _people.add(RandomListItem("Mervyn"));
    _people.add(RandomListItem("Fu Qiang"));
    _people.add(RandomListItem("KK"));
    _people.add(RandomListItem("Peter"));
    _lists.add(_people);
  }

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
        title: new Text("Randoom Pickr"),
      ),
      body: ListView(children: divided),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickAPlace,
        tooltip: 'Add new list',
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }

  _pickAPlace() {}
}
// move the list to the front page
