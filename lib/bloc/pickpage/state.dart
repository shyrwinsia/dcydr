import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PickPageState extends Equatable {
  const PickPageState();
}

class Uninitialized extends PickPageState {
  @override
  List<Object> get props => [];
}

class PickedItemState extends PickPageState {
  final String pick;
  PickedItemState({@required this.pick});

  @override
  List<Object> get props => [this.pick];

  @override
  String toString() => '[State] PickPageState: PickedItemState ${this.pick}';
}
