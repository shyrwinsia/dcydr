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

class DeleteAction extends PickPageEvent {
  @override
  String toString() => '[Event] PickPageEvent: DeleteAction';

  @override
  List<Object> get props => null;
}

class DeleteCancelled extends PickPageEvent {
  @override
  String toString() => '[Event] PickPageEvent: DeleteCancelled';

  @override
  List<Object> get props => null;
}

class DeleteConfirmed extends PickPageEvent {
  @override
  String toString() => '[Event] PickPageEvent: DeleteConfirmed';

  @override
  List<Object> get props => null;
}

class GetLastPickedItem extends PickPageEvent {
  @override
  String toString() => '[Event] PickPageEvent: GetLastPickedItem';

  @override
  List<Object> get props => null;
}

class EditAction extends PickPageEvent {
  @override
  String toString() => '[Event] PickPageEvent: EditAction';

  @override
  List<Object> get props => null;
}
