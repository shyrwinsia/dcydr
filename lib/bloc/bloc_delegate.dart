import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:choosr/logger/logger.dart';

class SimpleBlocDelegate extends BlocDelegate {
  Logger logger = getLogger();
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    logger.i(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.d(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    logger.e(error);
  }
}
