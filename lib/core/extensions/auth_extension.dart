import 'package:app_mobile/models/user/user_model.dart';
import 'package:app_mobile/providers/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AuthExtension on Ref {
  bool get isAuthenticated {
    return watch(authProvider) is Autenticated;
  }
}

extension CurrentUser on WidgetRef {
  UserModel? get currentUser {
    return watch(authProvider).value!.currentUser;
  }
}
