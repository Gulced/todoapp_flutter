import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/auth/auth.dart';
import '/core/core.dart';
import '/domain/domain.dart';

/// 1: Uygulamanın Ana Navigator'unu yönetmesi için GlobalKey.
final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  /// Ana Navigator anahtarını bu parametreye veriyoruz.
  navigatorKey: rootNavigatorKey,

  ///
  initialLocation: '/login',

  ///
  debugLogDiagnostics: true,

  /// Kullanıcı girişi doğrulama
  /// Kullanıcı giriş yapmamışsa [LoginView] sayfasına,
  /// giriş yapmışsa [DashboardView] yönlendirilir.
  redirect: _routeGuard,

  ///
  routes: _routes,
);

List<RouteBase> get _routes {
  return [
    /// Giriş Yap Ekranı için Rota
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginView(),
    ),

    /// Kaydol Ekranı için Rota
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignupView(),
    ),

    /// Dahboard Ekranı için Rota
    GoRoute(
      path: '/dashboard',
      name: 'dashboard',
      builder: (context, state) => const DashboardView(),
    ),
  ];
}

FutureOr<String?> _routeGuard(
  BuildContext context,
  GoRouterState state,
) async {
  const loginPath = '/login';
  const dasboardPath = '/dashboard';

  final isLoggedIn = await getIt<IStorageRepository>().getIsLogged();

  log('Auth-O: $isLoggedIn');

  if (isLoggedIn != null) {
    log('Auth-1: $isLoggedIn');

    /// Kullanıcı Oturum açtıysa
    if (isLoggedIn) {
      final isLoginScreen = state.matchedLocation == loginPath;

      /// DashboardView' yönlendir.
      log('Auth-2: $isLoggedIn');
      return isLoginScreen ? dasboardPath : null;

      /// LoginView'e yönlendir
    } else {
      log('Auth-3: $isLoggedIn');
      return loginPath;
    }
  }

  log('Auth-4: $isLoggedIn');
  return null;
}
