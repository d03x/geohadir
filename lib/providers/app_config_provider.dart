import 'package:app_mobile/models/app_config_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appConfigProvider = Provider<AppConfigModel>((ref) {
  return AppConfigModel.fromEnv();
});
