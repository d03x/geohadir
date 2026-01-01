import 'package:app_mobile/app/notifications/notification_controller.dart';
import 'package:app_mobile/routers/routers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      );
      AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      });
      return null;
    }, []);
    final screenSize = const Size(414, 896);
    return ScreenUtilInit(
      designSize: screenSize,
      builder: (context, child) {
        return MaterialApp.router(
          restorationScopeId: 'app',
          routerConfig: ref.watch(routerProvider),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
