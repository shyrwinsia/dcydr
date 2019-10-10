import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class RandomlistBloc extends Bloc<RandomlistEvent, RandomlistState> {
  @override
  RandomlistState get initialState => LoadingState();

  @override
  Stream<RandomlistState> mapEventToState(
    RandomlistEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
