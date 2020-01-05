import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';

abstract class RouterState extends Equatable {
  const RouterState();
}

class RouterHomePage extends RouterState {
  @override
  List<Object> get props => [];

  @override
  String toString() => '[State] RouterState: RouterHomePage';
}

class RouterPickPage extends RouterState {
  final RandomList list;

  RouterPickPage({this.list});

  @override
  List<Object> get props => [this.list];

  @override
  String toString() => '[State] RouterState: RouterPickPage';
}

class RouterAddPage extends RouterState {
  @override
  List<Object> get props => [];

  @override
  String toString() => '[State] RouterState: RouterPickPage';
}

class RouterPopPage extends RouterState {
  final String from;

  RouterPopPage({this.from});

  @override
  List<Object> get props => [this.from];

  @override
  String toString() => '[State] RouterState: RouterPopPage';
}

class RouterTogglePage extends RouterState {
  final RandomList list;

  RouterTogglePage({this.list});

  @override
  List<Object> get props => [this.list];

  @override
  String toString() => '[State] RouterState: RouterTogglePage';
}
