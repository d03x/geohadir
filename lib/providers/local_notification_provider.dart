import 'package:app_mobile/logger/logger.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocalNotificationProvider {
  final Ref ref;
  LocalNotificationProvider({required this.ref});
  @pragma('vm:entry-point')
  Future<void> _onActionReceivedMethod(ReceivedAction receivedAction) async {
    logger.info('hhahahellow');
  }

  void setup() {
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
