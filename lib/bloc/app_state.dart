import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class Uninitialized extends AppState {
  @override
  List<Object> get props => null;
}

class Loaded extends AppState {
  @override
  List<Object> get props => null;
}
