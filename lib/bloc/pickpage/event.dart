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

class PickOptions extends PickPageEvent {
  @override
  String toString() => '[Event] PickPageEvent: PickOptions';

  @override
  List<Object> get props => null;
}

class Reintialize extends PickPageEvent {
  @override
  String toString() => '[Event] PickPageEvent: Reintialize';

  @override
  List<Object> get props => null;
}
