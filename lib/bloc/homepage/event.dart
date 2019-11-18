import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomePageEvent extends Equatable {}

class LoadLists extends HomePageEvent {
  @override
  String toString() => '[State] HomePageEvent: FetchLists';

  @override
  List<Object> get props => null;
}
