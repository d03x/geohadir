import 'dart:io';

import 'package:app_mobile/network/interceptor.dart';
import 'package:app_mobile/providers/app_config_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

//ini adalah bagian dari http client
final httpClientProvider = Provider<Dio>((ref) {
  final config = ref.watch(appConfigProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: "${config.baseUrl}/api/",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {HttpHeaders.userAgentHeader: 'dio', 'common-header': 'xx'},
    ),
  );
  dio.interceptors.add(AppInterceptor(ref: ref));
  dio.interceptors.add(
    TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
        printResponseMessage: true,
      ),
    ),
  );
  return dio;
});
