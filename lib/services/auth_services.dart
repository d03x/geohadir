import 'package:app_mobile/core/network/http_client.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthServices {
  final Dio dio;
  AuthServices({required this.dio});
  Future getMe() async {
    final authrepo = await dio.get('me');
    return authrepo.data;
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final request = await dio.post(
      'auth/login',
      data: {'email': email, 'password': password},
    );
    return request.data;
  }
}

final authServicesProvider = Provider<AuthServices>((ref) {
  return AuthServices(dio: ref.watch(httpClientProvider));
});
