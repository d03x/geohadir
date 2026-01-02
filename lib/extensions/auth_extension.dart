import 'package:app_mobile/providers/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AuthExtension on Ref {
  bool get isAuthenticated {
    return watch(authServicesProvider) is Autenticated;
  }
}
