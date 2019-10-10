import 'package:equatable/equatable.dart';

abstract class RandomlistState extends Equatable {
  const RandomlistState();
}

class LoadingState extends RandomlistState {
  @override
  List<Object> get props => [];
}
