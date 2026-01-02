import 'package:app_mobile/providers/firebase_messaing_provider.dart';
import 'package:app_mobile/providers/local_notification_provider.dart';
import 'package:app_mobile/routers/routers.dart';
import 'package:app_mobile/themes/app_ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebseProvider = ref.watch(firebaseMessagingProvider);
    final localNotificaion = ref.watch(localNotificationProvider);
    useEffect(() {
      //add setup context
      localNotificaion.setup(context);
      firebseProvider.setup();
      firebseProvider.listenMessaing();
      return null;
    }, []);
    final screenSize = const Size(414, 896);
    return ScreenUtilInit(
      designSize: screenSize,
      builder: (context, child) {
        return MaterialApp.router(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: .light,
          restorationScopeId: 'app',
          routerConfig: ref.watch(routerProvider),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
