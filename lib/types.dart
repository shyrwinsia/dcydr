import 'package:flutter/material.dart';
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
  String _name;
  IconType _icon;
  List<RandomListItem> _items;

  RandomList(this._name, this._icon) {
    this._items = new List();
  }

  getName() {
    return this._name;
  }

  getActiveItems() {
    return this._items.where((i) => i.isSelected()).toList();
  }

  getItems() {
    return this._items;
  }

  add(RandomListItem item) {
    this._items.add(item);
  }

  remove(RandomListItem item) {
    this._items.remove(item);
  }

  Icon getIcon() {
    switch (_icon) {
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
      default:
        return Icon(
          FontAwesomeIcons.tag,
          color: Colors.grey,
        );
    }
  }
}

enum IconType { Person, Object, Place, Food, Animal, Music, Generic }
