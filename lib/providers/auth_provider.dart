import 'package:app_mobile/services/secure_storage_service.dart';
import 'package:app_mobile/state/auth_login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Autenticated extends AuthState {}

class AuthServices extends Notifier<AuthState> {
  final jwtKey = "jwt_key";
  @override
  AuthState build() {
    return AuthState();
  }

  Future<void> saveSession(String? token) async {
    if (token != null) {
      final storage = ref.watch(secureStorageServiceProvider);
      await storage.write(jwtKey, token);
    }
  }
}

final authServicesProvider = NotifierProvider<AuthServices, AuthState>(() {
  return AuthServices();
});
