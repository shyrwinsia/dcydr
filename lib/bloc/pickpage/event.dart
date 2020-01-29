import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PickPageEvent extends Equatable {
  const PickPageEvent();
}

class PickItem extends PickPageEvent {
  final RandomList list;
  PickItem({@required this.list});

  @override
  String toString() => '[Event] PickPageEvent: PickItem';

  @override
  List<Object> get props => [this.list];
}

class Reinitialize extends PickPageEvent {
  @override
  String toString() => '[Event] PickPageEvent: Reinitialize';

  @override
  List<Object> get props => null;
}
