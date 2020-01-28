import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';

abstract class ListPageEvent extends Equatable {
  const ListPageEvent();
}

class CreateList extends ListPageEvent {
  final RandomList list;
  CreateList({this.list});

  @override
  String toString() => '[Event] ListPageEvent: CreateList';

  @override
  List<Object> get props => [this.list];
}

class UpdateList extends ListPageEvent {
  final RandomList list;
  UpdateList({this.list});

  @override
  String toString() => '[Event] ListPageEvent: UpdateList';

  @override
  List<Object> get props => [this.list];
}
