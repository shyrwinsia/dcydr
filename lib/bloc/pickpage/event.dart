import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PickPageEvent extends Equatable {
  const PickPageEvent();
}

class PickItem extends PickPageEvent {
  final List items;
  PickItem({@required this.items});

  @override
  String toString() => '[Event] PickPageEvent: PickItem';

  @override
  List<Object> get props => [this.items];
}

class ToggleList extends PickPageEvent {
  @override
  String toString() => '[Event] PickPageEvent: ToggleList';

  @override
  List<Object> get props => null;
}

class Reinitialize extends PickPageEvent {
  @override
  String toString() => '[Event] PickPageEvent: Reinitialize';

  @override
  List<Object> get props => null;
}
