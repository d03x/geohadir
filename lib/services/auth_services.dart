import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthServices {
  Future<void> login({required String email, required String password}) {
    return Future.delayed(Duration(seconds: 100));
  }
}

final authServicesProvider = Provider<AuthServices>((ref) {
  return AuthServices();
});
