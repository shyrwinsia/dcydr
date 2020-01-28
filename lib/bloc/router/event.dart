import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RouterEvent extends Equatable {
  const RouterEvent();
}

class PopPage extends RouterEvent {
  final String from;

  PopPage({this.from});

  @override
  String toString() => '[Event] RouterEvent: PopPage from ${this.from}';

  @override
  List<Object> get props => [this.from];
}

class MoveToPickPage extends RouterEvent {
  final RandomList list;
  MoveToPickPage({@required this.list});

  @override
  String toString() => '[Event] RouterEvent: MoveToPickPage';

  @override
  List<Object> get props => [this.list];
}

class MoveToAddPage extends RouterEvent {
  @override
  String toString() => '[Event] RouterEvent: MoveToAddPage';

  @override
  List<Object> get props => null;
}

class MoveToEditPage extends RouterEvent {
  final RandomList list;
  MoveToEditPage({@required this.list});

  @override
  String toString() => '[Event] RouterEvent: MoveToEditPage';

  @override
  List<Object> get props => null;
}

class MoveToHomePage extends RouterEvent {
  @override
  String toString() => '[Event] RouterEvent: MoveToHomePage';

  @override
  List<Object> get props => null;
}

class MoveToTogglePage extends RouterEvent {
  final RandomList list;
  MoveToTogglePage({@required this.list});

  @override
  String toString() => '[Event] RouterEvent: MoveToTogglePage';

  @override
  List<Object> get props => [this.list];
}
