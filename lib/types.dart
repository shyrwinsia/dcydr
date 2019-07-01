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
        return Icon(FontAwesomeIcons.userAlt);
      case IconType.Object:
        return Icon(FontAwesomeIcons.box);
      case IconType.Place:
        return Icon(FontAwesomeIcons.mapMarker);
      case IconType.Food:
        return Icon(FontAwesomeIcons.cheese);
      case IconType.Animal:
        return Icon(FontAwesomeIcons.cat);
      case IconType.Music:
        return Icon(FontAwesomeIcons.music);
      default:
        return Icon(FontAwesomeIcons.tag);
    }
  }
}

enum IconType { Person, Object, Place, Food, Animal, Music, Generic }
