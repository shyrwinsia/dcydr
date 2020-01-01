import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class LoadLists extends HomePageEvent {
  @override
  String toString() => '[Event] HomePageEvent: LoadLists';

  @override
  List<Object> get props => null;
}

class Reinitialize extends HomePageEvent {
  @override
  String toString() => '[Event] HomePageEvent: Reinitialize';

  @override
  List<Object> get props => null;
}
