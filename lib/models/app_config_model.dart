import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfigModel {
  String appName;
  double appVersion;
  bool appDebug;
  String baseUrl;
  AppConfigModel({
    required this.appName,
    required this.appDebug,
    required this.appVersion,
    required this.baseUrl,
  });

  factory AppConfigModel.fromEnv() {
    return AppConfigModel(
      appName: dotenv.get('APP_NAME'),
      appDebug: dotenv.getBool('APP_DEBUG'),
      appVersion: dotenv.getDouble('APP_VERSION'),
      baseUrl: dotenv.get('BASE_URL'),
    );
  }
}
