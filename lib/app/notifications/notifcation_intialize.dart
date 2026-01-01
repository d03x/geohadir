import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotifcationIntialize {
  NotifcationIntialize._();
  static void initialize() {
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'channel_notif_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
          playSound: true,
          enableVibration: false,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'channel_notif_group',
          channelGroupName: 'Basic group',
        ),
      ],
      debug: true,
    );
  }
}
