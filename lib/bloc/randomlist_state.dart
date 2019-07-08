import 'package:Choosr/data/types.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RandomListState extends Equatable {
  RandomListState([List props = const []]) : super(props);
}

class RandomListLoading extends RandomListState {}

class RandomListLoaded extends RandomListState {
  final List<RandomList> randomList;

  RandomListLoaded(this.randomList) : super([randomList]);
}
