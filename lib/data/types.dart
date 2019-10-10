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

  Icon get icon {
    switch (this.type.toLowerCase()) {
      case "person":
        return Icon(
          FontAwesomeIcons.userAlt,
          color: Colors.lightBlue,
        );
      case "object":
        return Icon(
          FontAwesomeIcons.box,
          color: Colors.brown,
        );
      case "place":
        return Icon(
          FontAwesomeIcons.mapMarker,
          color: Colors.red,
        );
      case "food":
        return Icon(
          FontAwesomeIcons.utensils,
          color: Colors.green,
        );
      case "animal":
        return Icon(
          FontAwesomeIcons.cat,
          color: Colors.orange,
        );
      case "music":
        return Icon(
          FontAwesomeIcons.music,
          color: Colors.purple,
        );
      case "game":
        return Icon(
          FontAwesomeIcons.gamepad,
          color: Colors.indigo,
        );
      case "activity":
        return Icon(
          FontAwesomeIcons.running,
          color: Colors.deepPurple,
        );
      case "transport":
        return Icon(
          FontAwesomeIcons.rocket,
          color: Colors.deepOrange,
        );
      case "random":
        return Icon(
          FontAwesomeIcons.diceFive,
          color: Colors.blueGrey,
        );
      default:
        return Icon(
          FontAwesomeIcons.clipboardList,
          color: Colors.black87,
        );
    }
  }
}

class RandomListItem {
  final String name;
  bool selected = true;

  RandomListItem({@required this.name, this.selected});

  factory RandomListItem.fromMap(Map<String, dynamic> map) {
    return RandomListItem(name: map['name'], selected: map['selected']);
  }
}
