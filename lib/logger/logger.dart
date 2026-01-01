import 'package:app_mobile/logger/formatter.dart';
import 'package:talker_logger/talker_logger.dart';

final logger = TalkerLogger(
  settings: TalkerLoggerSettings(level: .debug),
  formatter: CustomFormmater(),
);
