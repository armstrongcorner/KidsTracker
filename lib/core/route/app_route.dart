import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids_tracker/v/main_screen.dart';

import '../../app.dart';
import '../../v/common_widgets/toast.dart';
import '../../v/splash_screen.dart';
import '../../v/user/login_screen.dart';
import '../use_l10n.dart';
import 'navigation_service.dart';

class RouteURL {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String registerEmail = '/registerEmail';
  static const String registerPassword = '/registerPassword';
  static const String main = '/main';
}

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    routes: [
      GoRoute(
        path: RouteURL.splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: RouteURL.login,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: RouteURL.main,
        builder: (context, state) {
          return MainScreen();
        },
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      if (tokenExpiredState.value &&
          state.uri.toString() != RouteURL.login &&
          state.uri.toString() != RouteURL.register) {
        tokenExpiredState.value = false;
        WSToast.show(useL10n(theContext: context).tokenExpireWarning,
            gravity: ToastGravity.BOTTOM);
        return RouteURL.login;
      }
      return null;
    },
    refreshListenable: tokenExpiredState,
  );
});
