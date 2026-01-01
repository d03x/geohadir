import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthState {}

class Autenticated extends AuthState {}

class AuthProvider extends Notifier<AuthState> {
  @override
  AuthState build() {
    return Autenticated();
  }
}

final authProvider = NotifierProvider<AuthProvider, AuthState>(() {
  return AuthProvider();
});
