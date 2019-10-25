import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class AppStarted extends AppEvent {
  @override
  String toString() => '[Event] AppEvent: AppStarted';

  @override
  List<Object> get props => null;
}
