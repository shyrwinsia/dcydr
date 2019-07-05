import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Datatype
class RandomListItem {
  String _name;
  bool _selected = true;

  RandomListItem(String name) {
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

class RandomList {
  int id;
  final String name;
  final IconType icon;
  final List<RandomListItem> items = new List();

  RandomList({@required this.name, @required this.icon});

  getName() {
    return this.name;
  }

  getActiveItems() {
    return this.items.where((i) => i.isSelected()).toList();
  }

  getItems() {
    return this.items;
  }

  add(RandomListItem item) {
    this.items.add(item);
  }

  remove(RandomListItem item) {
    this.items.remove(item);
  }

  Icon getIcon() {
    switch (this.icon) {
      case IconType.Person:
        return Icon(
          FontAwesomeIcons.userAlt,
          color: Colors.lightBlue,
        );
      case IconType.Object:
        return Icon(
          FontAwesomeIcons.box,
          color: Colors.brown,
        );
      case IconType.Place:
        return Icon(
          FontAwesomeIcons.mapMarker,
          color: Colors.red,
        );
      case IconType.Food:
        return Icon(
          FontAwesomeIcons.utensils,
          color: Colors.green,
        );
      case IconType.Animal:
        return Icon(
          FontAwesomeIcons.cat,
          color: Colors.orange,
        );
      case IconType.Music:
        return Icon(
          FontAwesomeIcons.music,
          color: Colors.purple,
        );
      case IconType.Game:
        return Icon(
          FontAwesomeIcons.gamepad,
          color: Colors.indigo,
        );
      case IconType.Activity:
        return Icon(
          FontAwesomeIcons.running,
          color: Colors.deepPurple,
        );
      case IconType.Transport:
        return Icon(
          FontAwesomeIcons.rocket,
          color: Colors.deepOrange,
        );
      case IconType.Random:
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

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'iconType': this.icon
      // add the list here too?
    };
  }

  static RandomList fromMap(Map<String, dynamic> map) {
    return RandomList(name: map['name'], icon: map['icon']);
  }
}

enum IconType {
  Person,
  Object,
  Place,
  Food,
  Animal,
  Music,
  Game,
  Activity,
  Transport,
  Random,
  Generic,
}
