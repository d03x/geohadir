import 'package:app_mobile/app/firebase/firebase_messaing_background_handler.dart';
import 'package:app_mobile/app/main_app.dart';
import 'package:app_mobile/app/notifications/notifcation_intialize.dart';
import 'package:app_mobile/logger/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotifcationIntialize.initialize();

  await Future.wait([dotenv.load(), Firebase.initializeApp()]).whenComplete(() {
    logger.info("App Initialized");
  });
  FirebaseMessaging.onBackgroundMessage(
    FirebaseMessaingBackgroundHandler.firebaseMessagingBackgroundHandler,
  );
  runApp(ProviderScope(child: MainApp()));
}
