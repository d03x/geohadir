import 'package:app_mobile/providers/auth_provider.dart';
import 'package:app_mobile/services/auth_services.dart';
import 'package:app_mobile/views/auth/state/auth_login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthLoginViewModel extends Notifier<AuthState> {
  @override
  AuthState build() {
    return AuthState();
  }

  Future<void> login({required String password, required String email}) async {
    final authServices = ref.read(authServicesProvider);
    state = AuthLoadingState();
    try {
      await authServices.login(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}

final authLoginViewModel = NotifierProvider<AuthLoginViewModel, AuthState>(() {
  return AuthLoginViewModel();
});
