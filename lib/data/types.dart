import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

// Datatypes
class RandomList {
  final String name;
  final String type;
  final List<RandomListItem> items;

  RandomList({
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
      case 'user':
        return Icon(
          FlatIcons.user,
          color: Colors.blue,
        );
      case 'star':
        return Icon(
          FlatIcons.star,
          color: Colors.orange,
        );
      case 'location':
        return Icon(
          FlatIcons.map_location,
          color: Colors.red,
        );
      case 'megaphone':
        return Icon(
          FlatIcons.megaphone,
          color: Colors.purple,
        );
      case 'diamond':
        return Icon(
          FlatIcons.diamond,
          color: Colors.indigo,
        );
      case 'tag':
        return Icon(
          FlatIcons.price_tag,
          color: Colors.cyan,
        );
      case 'idea':
        return Icon(
          FlatIcons.idea,
          color: Colors.amber,
        );
      default:
        return Icon(
          FlatIcons.list,
          color: Colors.teal,
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
      name: 'user',
      icon: FlatIcons.user,
      color: Colors.blue,
    ))
    ..add(RandomListType(
      name: 'star',
      icon: FlatIcons.star,
      color: Colors.orange,
    ))
    ..add(RandomListType(
      name: 'location',
      icon: FlatIcons.map_location,
      color: Colors.red,
    ))
    ..add(RandomListType(
      name: 'megaphone',
      icon: FlatIcons.megaphone,
      color: Colors.purple,
    ))
    ..add(RandomListType(
      name: 'diamond',
      icon: FlatIcons.diamond,
      color: Colors.indigo,
    ))
    ..add(RandomListType(
      name: 'tag',
      icon: FlatIcons.price_tag,
      color: Colors.cyan,
    ))
    ..add(RandomListType(
      name: 'idea',
      icon: FlatIcons.idea,
      color: Colors.amber,
    ))
    ..add(RandomListType(
      name: 'generic',
      icon: FlatIcons.list,
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
