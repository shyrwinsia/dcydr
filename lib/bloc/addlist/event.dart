import 'package:equatable/equatable.dart';

abstract class AddListPageEvent extends Equatable {
  const AddListPageEvent();
}

class AddListItem extends AddListPageEvent {
  @override
  String toString() => '[State] AddListPageEvent: AddListItem';

  @override
  List<Object> get props => null;
}

class PushListIcon extends AddListPageEvent {
  @override
  String toString() => '[State] AddListPageEvent: PushListIcon';

  @override
  List<Object> get props => null;
}

class ChooseListIcon extends AddListPageEvent {
  @override
  String toString() => '[State] AddListPageEvent: ChooseListIcon';

  @override
  List<Object> get props => null;
}

class SaveList extends AddListPageEvent {
  @override
  String toString() => '[State] AddListPageEvent: SaveList';

  @override
  List<Object> get props => null;
}
