import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecureStorageService {
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();
  Future<dynamic> write(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    await _flutterSecureStorage.read(key: key);
    return null;
  }
}

final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});
