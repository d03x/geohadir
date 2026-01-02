import 'package:app_mobile/providers/state/auth_login_state.dart';
import 'package:app_mobile/repository/auth_repository.dart';
import 'package:app_mobile/services/secure_storage_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Autenticated extends AuthState {
  Autenticated({super.currentUser});
}

class AuthServices extends AsyncNotifier<AuthState> {
  final jwtKey = "jwt_key";
  @override
  Future<AuthState> build() async {
    final storage = ref.watch(secureStorageServiceProvider);
    final token = await storage.read(jwtKey);
    if (token != null) {
      final userRepository = ref.watch(authRepositoryProvider);
      final data = await userRepository.getCurrentUser();
      return Autenticated(currentUser: data);
    } else {
      return AuthState();
    }
  }

  Future<void> saveSession(String? token) async {
    final storage = ref.watch(secureStorageServiceProvider);
    if (token != null) {
      await storage.write(jwtKey, token);
      state = AsyncValue.data(Autenticated());
    }
  }
}

final authProvider = AsyncNotifierProvider<AuthServices, AuthState>(() {
  return AuthServices();
});
