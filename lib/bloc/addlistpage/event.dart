import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';

abstract class AddListPageEvent extends Equatable {
  const AddListPageEvent();
}

class SaveList extends AddListPageEvent {
  final RandomList list;
  SaveList({this.list});

  @override
  String toString() => '[Event] AddListPageEvent: SaveList';

  @override
  List<Object> get props => [this.list];
}
