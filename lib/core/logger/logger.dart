import 'package:talker_logger/talker_logger.dart';

final logger = TalkerLogger(
  settings: TalkerLoggerSettings(level: .debug),
  formatter: ColoredLoggerFormatter(),
);
