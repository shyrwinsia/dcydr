import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

void main() => runApp(RandomLunch());

// Datatype
class Place {
  String _name;
  bool _selected = true;

  Place(String name) {
    this._name = name;
  }

  setSelected(bool selected) {
    this._selected = selected;
  }

  getName() {
    return this._name;
  }

  isSelected() {
    return this._selected;
  }
}

class RandomLunch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Lunch',
      theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: 'Raleway'),
      home: HomePage(title: 'Random Lunch'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<Place> _placesToEat = new Set();
  String _whereToEat = "";
  var rng = Random();

  _HomePageState() {
    _placesToEat.add(Place("Slave Food"));
    _placesToEat.add(Place("Korean one-North"));
    _placesToEat.add(Place("Koufu one-North"));
    _placesToEat.add(Place("Subway one-North"));
    _placesToEat.add(Place("Bismillah Biryani"));
    _placesToEat.add(Place("Arkadaş Cafe"));
    _placesToEat.add(Place("Burger King Vivo"));
    _placesToEat.add(Place("Kopitiam Vivo"));
    _placesToEat.add(Place("Texas Vivo"));
    _placesToEat.add(Place("Stuff'd Vivo"));
    _placesToEat.add(Place("Segar Buona Vista"));
    _placesToEat.add(Place("Korean Bouna Vista"));
    _placesToEat.add(Place("Texas Bouna Vista"));
    _placesToEat.add(Place("Burger King NUH"));
    _placesToEat.add(Place("Hawker NUH"));
    _placesToEat.add(Place("Kopitiam NUH"));
    _placesToEat.add(Place("Al Amaan"));
  }

  void _pickAPlace() {
    Place place;
    do {
      place = _placesToEat.elementAt(rng.nextInt(_placesToEat.length));
    } while (!place.isSelected());

    setState(() {
      _whereToEat = place.getName();
    });
  }

  void _moveToListPage() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<CustomSwitchTile> tiles = _placesToEat.map(
        (Place place) {
          return CustomSwitchTile(place);
        },
      );

      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('Places to eat'),
        ),
        body: ListView(children: divided),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _moveToListPage),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Where you are gonna eat lunch:",
            ),
            Text(
              '$_whereToEat',
              style: Theme.of(context).textTheme.display2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickAPlace,
        tooltip: 'Pick',
        child: Icon(FontAwesomeIcons.diceD20),
      ),
    );
  }
}

class CustomSwitchTile extends StatefulWidget {
  Place _place;

  CustomSwitchTile(Place place) {
    this._place = place;
  }

  @override
  _CustomSwitchTileState createState() => new _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  bool _v = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        widget._place.getName(),
        style: TextStyle(fontSize: 18.0),
      ),
      value: widget._place.isSelected(),
      onChanged: (value) => {
            setState(() {
              _v = value;
              widget._place.setSelected(value);
            })
          },
    );
  }
}
