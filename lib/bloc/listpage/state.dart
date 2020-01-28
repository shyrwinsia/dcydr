import 'package:equatable/equatable.dart';

abstract class ListPageState extends Equatable {
  const ListPageState();
}

class Uninitialized extends ListPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] ListPageState: Uninitialized';
}

class Saving extends ListPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] ListPageState: Saving';
}

class Saved extends ListPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] ListPageState: Saved';
}
