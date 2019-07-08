import 'package:Choosr/data/types.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RandomListEvent extends Equatable {
  RandomListEvent([List props = const []]) : super(props);
}

class LoadRandomList extends RandomListEvent {}

class AddRandomList extends RandomListEvent {}

class UpdateRandomList extends RandomListEvent {
  final RandomList randomList;
  UpdateRandomList(this.randomList) : super([randomList]);
}

class DeleteRandomList extends RandomListEvent {
  final RandomList randomList;
  DeleteRandomList(this.randomList) : super([randomList]);
}
