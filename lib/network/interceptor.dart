import 'package:app_mobile/services/secure_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppInterceptor extends Interceptor {
  final Ref ref;
  AppInterceptor({required this.ref});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final tokenService = ref.read(secureStorageServiceProvider);
    final token = await tokenService.read('jwt_key');
    if (token != null) {
      options.headers['Authorization'] = "Bearer $token";
    }
    return handler.next(options);
  }
}
