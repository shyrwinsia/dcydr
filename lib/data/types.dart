import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';

// Datatypes
class RandomList {
  final num id;
  final String name;
  final String type;
  final List<RandomListItem> items;

  RandomList({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.items,
  });

  List<RandomListItem> get active {
    return this.items.where((i) => i.selected).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'type': this.type,
    };
  }

  factory RandomList.fromMap(int key, Map<String, dynamic> map) {
    return RandomList(
      id: key,
      name: map['name'],
      type: map['type'],
      items: RandomList.createItemsFromMap(map['items']),
    );
  }

  static List<RandomListItem> createItemsFromMap(List map) {
    return map.map((f) => RandomListItem.fromMap(f));
  }

  static Icon iconFromType(String type) {
    switch (type.toLowerCase()) {
      case 'people':
        return Icon(
          FontAwesomeIcons.userAlt,
          color: Colors.lightBlue,
          size: 20,
        );
      case 'objects':
        return Icon(
          FontAwesomeIcons.box,
          color: Colors.brown,
          size: 20,
        );
      case 'places':
        return Icon(
          FontAwesomeIcons.mapMarker,
          color: Colors.red,
          size: 20,
        );
      case 'food':
        return Icon(
          FontAwesomeIcons.utensils,
          color: Colors.green,
          size: 20,
        );
      case 'animals':
        return Icon(
          FontAwesomeIcons.cat,
          color: Colors.orange,
          size: 20,
        );
      case 'music':
        return Icon(
          FontAwesomeIcons.music,
          color: Colors.purple,
          size: 20,
        );
      case 'games':
        return Icon(
          FontAwesomeIcons.gamepad,
          color: Colors.indigo,
          size: 20,
        );
      case 'activities':
        return Icon(
          FontAwesomeIcons.running,
          color: Colors.deepPurple,
          size: 20,
        );
      case 'transportation':
        return Icon(
          FontAwesomeIcons.rocket,
          color: Colors.deepOrange,
          size: 20,
        );
      case 'random':
        return Icon(
          FontAwesomeIcons.diceFive,
          color: Colors.blueGrey,
          size: 20,
        );
      default:
        return Icon(
          FontAwesomeIcons.clipboardList,
          color: Colors.teal,
          size: 20,
        );
    }
  }

  Icon get icon {
    return RandomList.iconFromType(this.type);
  }
}

class RandomListTypes {
  static final List types = List<RandomListType>()
    ..add(RandomListType(
      name: 'People',
      icon: FontAwesomeIcons.userAlt,
      color: Colors.lightBlue,
    ))
    ..add(RandomListType(
      name: 'Objects',
      icon: FontAwesomeIcons.box,
      color: Colors.brown,
    ))
    ..add(RandomListType(
      name: 'Places',
      icon: FontAwesomeIcons.mapMarker,
      color: Colors.red,
    ))
    ..add(RandomListType(
      name: 'Food',
      icon: FontAwesomeIcons.utensils,
      color: Colors.green,
    ))
    ..add(RandomListType(
      name: 'Animals',
      icon: FontAwesomeIcons.cat,
      color: Colors.orange,
    ))
    ..add(RandomListType(
      name: 'Music',
      icon: FontAwesomeIcons.music,
      color: Colors.purple,
    ))
    ..add(RandomListType(
      name: 'Games',
      icon: FontAwesomeIcons.gamepad,
      color: Colors.indigo,
    ))
    ..add(RandomListType(
      name: 'Activities',
      icon: FontAwesomeIcons.running,
      color: Colors.deepPurple,
    ))
    ..add(RandomListType(
      name: 'Transportation',
      icon: FontAwesomeIcons.rocket,
      color: Colors.deepOrange,
    ))
    ..add(RandomListType(
      name: 'Random',
      icon: FontAwesomeIcons.diceFive,
      color: Colors.blueGrey,
    ))
    ..add(RandomListType(
      name: 'Generic',
      icon: FontAwesomeIcons.clipboardList,
      color: Colors.teal,
    ));
}

class RandomListType {
  final IconData icon;
  final Color color;
  final String name;

  RandomListType({
    @required this.name,
    @required this.icon,
    @required this.color,
  });
}

class RandomListItem {
  final String name;
  bool selected = true;

  RandomListItem({
    @required this.name,
    this.selected,
  });

  factory RandomListItem.fromMap(Map<String, dynamic> map) {
    return RandomListItem(name: map['name'], selected: map['selected']);
  }
}
