import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TogglePageEvent extends Equatable {
  const TogglePageEvent();
}

class SaveListEvent extends TogglePageEvent {
  final RandomList list;
  SaveListEvent({@required this.list});

  @override
  String toString() => '[Event] TogglePageEvent: SaveListEvent';

  @override
  List<Object> get props => [this.list];
}
