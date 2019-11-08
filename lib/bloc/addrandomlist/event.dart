import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RandomListEvent extends Equatable {
  const RandomListEvent();
}

class AddItemToList extends RandomListEvent {
  final RandomList list;
  final RandomListItem item;

  AddItemToList({
    this.list,
    this.item,
  });

  @override
  String toString() => '[Event] RandomlistEvent: AddItemToList';

  @override
  List<Object> get props => [this.list];
}

class RemoveListItem extends RandomListEvent {
  final RandomList list;
  final RandomListItem item;

  RemoveListItem({
    this.list,
    this.item,
  });

  @override
  String toString() => '[Event] RandomlistEvent: RemoveListItem';

  @override
  List<Object> get props => [this.item];
}

class SubmitList extends RandomListEvent {
  final RandomList list;
  SubmitList(this.list);

  @override
  String toString() => '[Event] RandomlistEvent: SubmitList';

  @override
  List<Object> get props => [this.list];
}
