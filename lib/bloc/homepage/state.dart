import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomePageState extends Equatable {}

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

class Success extends HomePageState {
  final RandomList list;

  Success({list}) : this.list = list ?? RandomList.empty();

  @override
  String toString() => '[State] HomePageState: Success';

  List<Object> get props => [this.list];
}

class Failed extends HomePageState {
  final String message;

  Failed({this.message});

  @override
  String toString() => '[State] HomePageState: Failed';

  List<Object> get props => [this.message];
}