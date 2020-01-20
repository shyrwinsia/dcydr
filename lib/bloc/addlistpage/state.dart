import 'package:equatable/equatable.dart';

abstract class AddListPageState extends Equatable {
  const AddListPageState();
}

class Uninitialized extends AddListPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] AddListPageState: Uninitialized';
}

class Saving extends AddListPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] AddListPageState: Saving';
}

class Saved extends AddListPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] AddListPageState: Saved';
}
