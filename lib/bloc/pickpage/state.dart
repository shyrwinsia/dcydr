import 'package:equatable/equatable.dart';

abstract class PickState extends Equatable {
  const PickState();
}

class InitialPickState extends PickState {
  @override
  List<Object> get props => [];
}
