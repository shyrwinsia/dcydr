import 'package:logger/logger.dart';

class EventStatePrinter extends LogPrinter {
  @override
  void log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    print(event.level);
    var message = event.message;
    println(color('$emoji $message'));
  }
}

Logger getLogger() => Logger(printer: EventStatePrinter());
