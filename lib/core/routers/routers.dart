import 'package:app_mobile/providers/auth_provider.dart';
import 'package:app_mobile/views/auth/login/auth_login_view.dart';
import 'package:app_mobile/views/errors/errors_view.dart';
import 'package:app_mobile/views/index_view.dart';
import 'package:app_mobile/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'route.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authprovider = ref.watch(authProvider);
  return GoRouter(
    restorationScopeId: 'router',
    errorBuilder: (context, state) => ErrorsView(),
    redirect: (context, state) {
      if (authprovider.isLoading) {
        return context.namedLocation('splashScreen');
      }
      final user = authprovider.value;
      print(user is Autenticated);
      if (user is! Autenticated) {
        return context.namedLocation('signIn');
      }

      return null;
    },
    routes: [
      Route(
        path: '/',
        name: 'index',
        renderView: (context, state) {
          return IndexView();
        },
      ),
      Route(
        path: '/splash',
        name: 'splashScreen',
        renderView: (context, state) {
          return SplashView();
        },
      ),
      Route(
        path: '/signIn',
        name: 'signIn',
        renderView: (context, state) => AuthLoginView(),
      ),
    ],
  );
});
