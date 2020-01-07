import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PickPageState extends Equatable {
  const PickPageState();
}

class Uninitialized extends PickPageState {
  @override
  List<Object> get props => null;
}

class PickedItemState extends PickPageState {
  final String pick;
  PickedItemState({@required this.pick});

  @override
  List<Object> get props => [this.pick];

  @override
  String toString() => '[State] PickPageState: PickedItemState ${this.pick}';
}

class NoItemToPickState extends PickPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] PickPageState: NoItemToPickState';
}

class CannotPickState extends PickPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] PickPageState: CannotPickState';
}
