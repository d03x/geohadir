import 'package:app_mobile/app/firebase/setup_firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseMessagingProvider = Provider<SetupFirebaseMessaging>((ref) {
  return SetupFirebaseMessaging();
});
