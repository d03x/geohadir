import 'package:app_mobile/logger/logger.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationController {
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    if (receivedAction.buttonKeyPressed == 'BUKA_CHAT') {
      logger.info('hhahahellow');
    }
  }
}
