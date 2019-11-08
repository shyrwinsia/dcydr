import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RandomListState extends Equatable {}

class ListItemState extends RandomListState {
  final RandomList list;

  // Initializa and empty list if there is nothing passed
  ListItemState({list}) : this.list = list ?? RandomList.empty();
  @override
  String toString() => '[State] RandomListState: ListItemState';

  @override
  List<Object> get props => null;
}

class Success extends RandomListState {
  @override
  String toString() => '[State] RandomListState: Success';

  @override
  List<Object> get props => null;
}

class Failed extends RandomListState {
  @override
  String toString() => '[State] RandomListState: Failed';

  @override
  List<Object> get props => null;
}
