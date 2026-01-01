import 'package:app_mobile/logger/logger.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SetupFirebaseMessaging {
  Future<void> setup() async {
    FirebaseMessaging instance = FirebaseMessaging.instance;
    NotificationSettings settings = await instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      logger.info('User granted permission');
      final fcm = await instance.getToken();
      logger.info('FCM:TOKEN $fcm');
    }
  }

  void listenMessaing() {
    FirebaseMessaging.onMessage.listen((event) {
      if (event.notification != null) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: event.notification!.title,
            body: event.notification!.body,
            actionType: .DismissAction,
          ),
        );
      }
    });
  }
}
