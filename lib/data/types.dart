import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

// Datatypes
class RandomList {
  final int key;
  final String name;
  final String type;
  final List<RandomListItem> items;

  RandomList({
    this.key: -1,
    @required this.name,
    @required this.type,
    @required this.items,
  });

  List<RandomListItem> get active =>
      this.items.where((i) => i.selected).toList();

  Map<String, dynamic> toMap() => {
        'name': this.name,
        'type': this.type,
        'items': RandomList.createItemsToMap(items),
      };

  factory RandomList.fromMap(int key, Map<String, dynamic> map) => RandomList(
        key: key,
        name: map['name'],
        type: map['type'],
        items: RandomList.createItemsFromMap(map['items']),
      );

  factory RandomList.empty() => RandomList(
        name: '',
        type: 'generic',
        items: List<RandomListItem>(),
      );

  static List<Map> createItemsToMap(List<RandomListItem> items) => items
      .map(
        (f) => Map()
          ..addAll(
            {
              'name': f.name,
              'selected': f.selected,
            },
          ),
      )
      .toList();

  static List<RandomListItem> createItemsFromMap(List map) =>
      map.map((f) => RandomListItem.fromMap(f)).toList();

  static Icon iconFromType(String type) {
    switch (type.toLowerCase()) {
      case 'user':
        return Icon(
          FlatIcons.user,
          color: Colors.blue,
          size: 18,
        );
      case 'star':
        return Icon(
          FlatIcons.star,
          color: Colors.orange,
          size: 18,
        );
      case 'location':
        return Icon(
          FlatIcons.map_location,
          color: Colors.red,
          size: 18,
        );
      case 'megaphone':
        return Icon(
          FlatIcons.megaphone,
          color: Colors.purple,
          size: 18,
        );
      case 'diamond':
        return Icon(
          FlatIcons.diamond,
          color: Colors.indigo,
          size: 18,
        );
      case 'tag':
        return Icon(
          FlatIcons.price_tag,
          color: Colors.cyan,
          size: 18,
        );
      case 'idea':
        return Icon(
          FlatIcons.idea,
          color: Colors.amber,
          size: 18,
        );
      case 'time':
        return Icon(
          FlatIcons.time,
          color: Colors.deepPurple,
          size: 18,
        );
      default:
        return Icon(
          FlatIcons.list,
          color: Colors.teal,
          size: 16,
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
      name: 'time',
      icon: FlatIcons.time,
      color: Colors.deepPurple,
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

  factory RandomListItem.fromMap(Map<String, dynamic> map) =>
      RandomListItem(name: map['name'], selected: map['selected']);

  factory RandomListItem.empty() => RandomListItem(name: '', selected: true);
  factory RandomListItem.withName(String name) =>
      RandomListItem(name: name, selected: true);
}
