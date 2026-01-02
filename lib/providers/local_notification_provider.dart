import 'package:app_mobile/logger/logger.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//HArS GLOBAL FUNCTION
@pragma('vm:entry-point')
Future<void> _onActionReceivedMethod(ReceivedAction receivedAction) async {
  logger.info('hhahahellow');
}

class LocalNotificationProvider {
  final Ref ref;
  LocalNotificationProvider({required this.ref});
  void setup(BuildContext context) {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: _onActionReceivedMethod,
    );
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }
}

final localNotificationProvider = Provider<LocalNotificationProvider>((ref) {
  return LocalNotificationProvider(ref: ref);
});
