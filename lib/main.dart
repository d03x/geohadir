import 'package:app_mobile/app/main_app.dart';
import 'package:app_mobile/app/notifications/notifcation_intialize.dart';
import 'package:app_mobile/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotifcationIntialize.initialize();
  logger.info("Initialize App");
  runApp(ProviderScope(child: MainApp()));
}
