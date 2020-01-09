import 'package:dcydr/data/types.dart';
import 'package:equatable/equatable.dart';

abstract class TogglePageState extends Equatable {
  const TogglePageState();
}

class PageLoaded extends TogglePageState {
  final RandomList list;

  PageLoaded({this.list});

  @override
  List<Object> get props => [this.list];

  @override
  String toString() => '[State] TogglePageState: PageLoaded';
}
