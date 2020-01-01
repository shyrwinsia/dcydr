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
  List<Object> get props => [];

  @override
  String toString() => '[State] RouterState: RouterPickPage';
}

class RouterAddPage extends RouterState {
  @override
  List<Object> get props => [];

  @override
  String toString() => '[State] RouterState: RouterPickPage';
}
