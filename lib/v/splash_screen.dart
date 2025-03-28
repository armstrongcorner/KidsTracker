import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../core/general_exception.dart';
import '../core/route/app_route.dart';
import '../core/session_manager.dart';
import '../core/utils/string_util.dart';
import '../m/user_info_result_model.dart';
import '../vm/user_provider.dart';
import 'common_widgets/color.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoState = ref.watch(userProvider);

    useEffect(() {
      // _handleInitRoute(context, ref);
      _fetchUserInfo(context, ref, userInfoState);

      return () {};
    }, const []);

    return userInfoState.when(
      loading: () => Container(
        color: WSColor.primaryBgColor,
        child:
            const Center(child: CircularProgressIndicator(color: Colors.grey)),
      ),
      data: (data) {
        if (data != null) {
          if ((data.isSuccess ?? false) && data.failureReason == null) {
            final appRouter = ref.read(appRouterProvider);
            appRouter.go(RouteURL.main);
          } else {
            return Container(
              color: WSColor.primaryBgColor,
              child: Center(
                child: Text(
                  getErrorMessage(data.failureReason!),
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
            );
          }
        }

        return Container(color: WSColor.primaryBgColor);
      },
      error: (Object error, StackTrace stackTrace) {
        return Container(
          color: WSColor.primaryBgColor,
          child: Center(
            child: Text(
              getErrorMessage(getErrorCode(
                  GeneralException.toGeneralException(error as Exception))),
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
        );
      },
    );
  }

  Future<void> _fetchUserInfo(BuildContext context, WidgetRef ref,
      AsyncValue<UserInfoResultModel?> userInfoState) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final sessionManager = ref.read(sessionManagerProvider);
    final savedUsername = sessionManager.getUsername();
    final savedToken = sessionManager.getToken();

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) async {
      // version number
      await sessionManager.setAppVersion(packageInfo.version);
      // platform
      if (Platform.isIOS) {
        await sessionManager.setAppOS('iOS');
      } else if (Platform.isAndroid) {
        await sessionManager.setAppOS('Android');
      } else {
        await sessionManager.setAppOS('other');
      }
    });

    if (isNotEmpty(savedUsername) && isNotEmpty(savedToken)) {
      // Login before, using get user info api to validate the existing token
      ref.read(userProvider.notifier).getUserInfo(savedUsername);
    } else {
      // Not login before, go to login page
      final appRouter = ref.read(appRouterProvider);
      appRouter.go(RouteURL.login);
    }
  }
}
