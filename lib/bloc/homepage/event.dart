import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class LoadLists extends HomePageEvent {
  @override
  String toString() => '[Event] HomePageEvent: LoadLists';

  @override
  List<Object> get props => null;
}

class ChooseList extends HomePageEvent {
  final RandomList list;
  ChooseList({@required this.list});

  @override
  String toString() => '[Event] HomePageEvent: ChooseList';

  @override
  List<Object> get props => [this.list];
}

class AddList extends HomePageEvent {
  @override
  String toString() => '[Event] HomePageEvent: AddList';

  @override
  List<Object> get props => null;
}
