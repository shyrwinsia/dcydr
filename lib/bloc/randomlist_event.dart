import 'package:choosr/data/types.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RandomlistEvent extends Equatable {
  const RandomlistEvent();
}

class LoadRandomList extends RandomlistEvent {
  @override
  List<Object> get props => null;
}

class AddRandomList extends RandomlistEvent {
  final RandomList randomList;

  AddRandomList({@required this.randomList});

  @override
  List<Object> get props => [randomList];
}
