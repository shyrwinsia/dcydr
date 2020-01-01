import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomePageState extends Equatable {
  const HomePageState();
}

class Uninitialized extends HomePageState {
  @override
  String toString() => '[State] HomePageState: Uninitialized';
  @override
  List<Object> get props => null;
}

class Loading extends HomePageState {
  @override
  String toString() => '[State] HomePageState: Loading';
  @override
  List<Object> get props => null;
}

class Loaded extends HomePageState {
  final List<RandomList> list;

  Loaded({this.list});

  @override
  String toString() => '[State] HomePageState: Loaded';

  List<Object> get props => [this.list];
}
