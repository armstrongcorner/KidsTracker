import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/constants/size.dart';
import 'core/route/app_route.dart';
import 'core/theme/themes.dart';
import 'core/utils/sp_util.dart';
import 'core/utils/string_util.dart';
import 'vm/misc_provider.dart';

final tokenExpiredState = ValueNotifier<bool>(false);

class _LifecycleObserver extends WidgetsBindingObserver {
  final VoidCallback? onResumed;
  final VoidCallback? onPaused;
  final VoidCallback? onInactive;

  _LifecycleObserver({this.onResumed, this.onPaused, this.onInactive});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (onResumed != null) onResumed!();
        break;
      case AppLifecycleState.paused:
        if (onPaused != null) onPaused!();
        break;
      case AppLifecycleState.inactive:
        if (onInactive != null) onInactive!();
        break;
      default:
        break;
    }
  }
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final observer = _LifecycleObserver(
        onResumed: () => debugPrint('App Resumed'),
        onPaused: () => debugPrint('App Paused'),
        onInactive: () => debugPrint('App Inactive'),
      );
      // 注册观察者
      WidgetsBinding.instance.addObserver(observer);

      return () {
        WidgetsBinding.instance.removeObserver(observer);
      };
    }, []);

    final appRouter = ref.watch(appRouterProvider);
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(WSSize.designWidth, WSSize.designHeight),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          localeListResolutionCallback: (deviceLocales, supportedLocales) {
            final currentLanguage = SpUtil.getString(SpKeys.SELECTED_LANGUAGE);
            Locale initialLocale;
            if (isEmpty(currentLanguage)) {
              initialLocale = const Locale('en', 'US');
            } else {
              initialLocale = Locale(languageMap[currentLanguage] ??
                  supportedLocales.first.languageCode);
            }

            SpUtil.putString(SpKeys.SELECTED_LANGUAGE,
                initialLocale.languageCode == 'zh' ? '中文' : 'English');
            return initialLocale;
          },
          locale: ref.watch(languageProvider),
          routeInformationParser: appRouter.routeInformationParser,
          routeInformationProvider: appRouter.routeInformationProvider,
          routerDelegate: appRouter.routerDelegate,
          builder: EasyLoading.init(
            builder: (context, child) {
              return GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  }
                },
                child: child,
              );
            },
          ),
          theme: getApplicationTheme(),
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
