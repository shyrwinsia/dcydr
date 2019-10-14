import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
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
          FlatIcons.user,
          color: Colors.lightBlue,
          size: 20,
        );
      case 'objects':
        return Icon(
          FlatIcons.user,
          color: Colors.brown,
          size: 20,
        );
      case 'places':
        return Icon(
          FlatIcons.pin,
          color: Colors.red,
          size: 20,
        );
      case 'food':
        return Icon(
          FlatIcons.user,
          color: Colors.green,
          size: 20,
        );
      case 'animals':
        return Icon(
          FlatIcons.user,
          color: Colors.orange,
          size: 20,
        );
      case 'music':
        return Icon(
          FlatIcons.user,
          color: Colors.purple,
          size: 20,
        );
      case 'games':
        return Icon(
          FlatIcons.user,
          color: Colors.indigo,
          size: 20,
        );
      case 'activities':
        return Icon(
          FlatIcons.user,
          color: Colors.deepPurple,
          size: 20,
        );
      case 'transportation':
        return Icon(
          FlatIcons.user,
          color: Colors.deepOrange,
          size: 20,
        );
      case 'random':
        return Icon(
          FlatIcons.user,
          color: Colors.blueGrey,
          size: 20,
        );
      default:
        return Icon(
          FlatIcons.user,
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
      icon: FlatIcons.user,
      color: Colors.lightBlue,
    ))
    ..add(RandomListType(
      name: 'Objects',
      icon: FlatIcons.user,
      color: Colors.brown,
    ))
    ..add(RandomListType(
      name: 'Places',
      icon: FlatIcons.user,
      color: Colors.red,
    ))
    ..add(RandomListType(
      name: 'Food',
      icon: FlatIcons.user,
      color: Colors.green,
    ))
    ..add(RandomListType(
      name: 'Animals',
      icon: FlatIcons.user,
      color: Colors.orange,
    ))
    ..add(RandomListType(
      name: 'Music',
      icon: FlatIcons.user,
      color: Colors.purple,
    ))
    ..add(RandomListType(
      name: 'Games',
      icon: FlatIcons.user,
      color: Colors.indigo,
    ))
    ..add(RandomListType(
      name: 'Activities',
      icon: FlatIcons.user,
      color: Colors.deepPurple,
    ))
    ..add(RandomListType(
      name: 'Transportation',
      icon: FlatIcons.user,
      color: Colors.deepOrange,
    ))
    ..add(RandomListType(
      name: 'Random',
      icon: FlatIcons.user,
      color: Colors.blueGrey,
    ))
    ..add(RandomListType(
      name: 'Generic',
      icon: FlatIcons.user,
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
