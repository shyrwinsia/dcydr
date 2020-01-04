import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RouterEvent extends Equatable {
  const RouterEvent();
}

class PopPage extends RouterEvent {
  @override
  String toString() => '[Event] RouterEvent: PopPage';

  @override
  List<Object> get props => null;
}

class MoveToPickPage extends RouterEvent {
  final RandomList list;
  MoveToPickPage({@required this.list});

  @override
  String toString() => '[Event] RouterEvent: MoveToPickPage';

  @override
  List<Object> get props => null;
}

class MoveToAddPage extends RouterEvent {
  @override
  String toString() => '[Event] RouterEvent: MoveToAddPage';

  @override
  List<Object> get props => null;
}

class MoveToHomePage extends RouterEvent {
  @override
  String toString() => '[Event] RouterEvent: MoveToHomePage';

  @override
  List<Object> get props => null;
}
