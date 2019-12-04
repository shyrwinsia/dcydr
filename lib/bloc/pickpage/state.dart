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

class MoveToPickOptionsPage extends PickPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] PickPageState: MoveToPickOptionsPage';
}

class DeleteConfirmDialog extends PickPageState {
  final String pick;
  DeleteConfirmDialog({@required this.pick});

  @override
  List<Object> get props => [this.pick];
  @override
  String toString() => '[State] PickPageState: DeleteConfirmDialog';
}

class CloseConfirmDialog extends PickPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] PickPageState: CloseConfirmDialog';
}

class DeleteList extends PickPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] PickPageState: DeleteList';
}
