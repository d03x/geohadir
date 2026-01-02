import 'package:app_mobile/models/auth/auth_response_model.dart';
import 'package:app_mobile/models/user/user_model.dart';
import 'package:app_mobile/services/auth_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthRepository {
  final AuthServices authServices;
  AuthRepository({required this.authServices});
  Future<AuthLoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    final auth = await authServices.login(email: email, password: password);
    return AuthLoginResponseModel.fromJson(auth);
  }

  Future<UserModel> getCurrentUser() async {
    final auth = await authServices.getMe();
    return UserModel.fromJson(auth['user']);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(authServices: ref.watch(authServicesProvider));
});
