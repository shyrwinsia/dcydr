import 'package:equatable/equatable.dart';

abstract class EditListPageState extends Equatable {
  const EditListPageState();
}

class Uninitialized extends EditListPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] EditListPageState: Uninitialized';
}

class Saving extends EditListPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] EditListPageState: Saving';
}

class Saved extends EditListPageState {
  @override
  List<Object> get props => null;

  @override
  String toString() => '[State] EditListPageState: Saved';
}
