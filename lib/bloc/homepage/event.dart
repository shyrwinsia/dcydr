import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class LoadLists extends HomePageEvent {
  @override
  String toString() => '[State] HomePageEvent: LoadLists';

  @override
  List<Object> get props => null;
}
