import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';

abstract class EditListPageEvent extends Equatable {
  const EditListPageEvent();
}

class SaveList extends EditListPageEvent {
  final RandomList list;
  SaveList({this.list});

  @override
  String toString() => '[Event] EditListPageEvent: SaveList';

  @override
  List<Object> get props => [this.list];
}
