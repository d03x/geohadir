import 'package:app_mobile/core/logger/logger.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessaingBackgroundHandler {
  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp();
    if (message.notification != null) {
      logger.info(message.notification!.toMap());
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: message.notification!.title,
          body: message.notification!.body,
          actionType: .DismissAction,
        ),
      );
    }
  }
}
