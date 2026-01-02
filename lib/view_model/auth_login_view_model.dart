import 'package:app_mobile/model/auth/auth_response_model.dart';
import 'package:app_mobile/providers/auth_provider.dart';
import 'package:app_mobile/repository/auth_repository.dart';
import 'package:app_mobile/state/auth_login_state.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthLoginViewModel extends Notifier<AuthState> {
  @override
  AuthState build() {
    return AuthState();
  }

  Future<void> login({required String password, required String email}) async {
    final authRepository = ref.read(authRepositoryProvider);
    final authProvider = ref.read(authServicesProvider.notifier);
    state = AuthLoadingState();
    try {
      final AuthLoginResponseModel loggedin = await authRepository.login(
        email: email,
        password: password,
      );
      await authProvider.saveSession(loggedin.jwt!.accessToken);
      state = AuthState();
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 422) {
          state = AuthValidationErrorState.fromJson(e.response!.data);
        }
      }
      state = AuthState();
    }
  }
}

final authLoginViewModel = NotifierProvider<AuthLoginViewModel, AuthState>(() {
  return AuthLoginViewModel();
});
