import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class StartedApp extends AppEvent {
  @override
  String toString() => '[Event] AuthenticationEvent: StartApp';

  @override
  List<Object> get props => null;
}
