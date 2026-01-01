import 'package:talker_logger/talker_logger.dart';

class CustomFormmater implements LoggerFormatter {
  @override
  String fmt(LogDetails details, TalkerLoggerSettings settings) {
    final msg = details.message?.toString() ?? '';
    final coloredMsg = msg
        .split('\n')
        .map((e) => details.pen.write(e))
        .toList()
        .join('\n');
    return coloredMsg;
  }
}
