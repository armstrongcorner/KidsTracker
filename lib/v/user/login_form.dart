import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/general_exception.dart';
import '../../core/route/app_route.dart';
import '../../core/session_manager.dart';
import '../../core/use_l10n.dart';
import '../../core/utils/string_util.dart';
import '../../vm/user_provider.dart';
import '../common_widgets/loading_button.dart';
import '../common_widgets/toast.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionManager = ref.read(sessionManagerProvider);
    // final usernameNode = useFocusNode();
    // final passwordNode = useFocusNode();
    final usernameController =
        useTextEditingController(text: sessionManager.getUsername());
    final passwordController = useTextEditingController();

    final isLoading = useState(false);

    return Form(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 1.0.sh,
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Align(
              //   alignment: Alignment.center,
              //   child: Image.asset(
              //     'assets/images/godscript_logo.png',
              //     width: 0.6.sw,
              //     height: 0.6.sw,
              //   ),
              // ),
              const Spacer(flex: 3),
              // 1）Username
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextFormField(
                  controller: usernameController,
                  // focusNode: usernameNode,
                  enableSuggestions: false,
                  autocorrect: false,
                  readOnly: isLoading.value,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: useL10n(theContext: context).usernameHint,
                    labelStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                    ),
                    suffixIcon:
                        isNotEmpty(usernameController.text) && !isLoading.value
                            ? IconButton(
                                onPressed: () {
                                  usernameController.clear();
                                },
                                icon: const Icon(
                                  Icons.highlight_off,
                                  color: Colors.grey,
                                ),
                              )
                            : null,
                    contentPadding:
                        EdgeInsets.fromLTRB(40.w, 10.h, -40.w, 10.h),
                  ),
                ),
              ),
              // 2) Password
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextFormField(
                  controller: passwordController,
                  // focusNode: passwordNode,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  readOnly: isLoading.value,
                  decoration: InputDecoration(
                    labelText: useL10n(theContext: context).password,
                    labelStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.h),
                      child: const Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                    ),
                    suffixIcon:
                        isNotEmpty(passwordController.text) && !isLoading.value
                            ? IconButton(
                                onPressed: () {
                                  passwordController.clear();
                                },
                                icon: const Icon(
                                  Icons.highlight_off,
                                  color: Colors.grey,
                                ),
                              )
                            : null,
                    contentPadding:
                        EdgeInsets.fromLTRB(40.w, 10.h, -40.w, 10.h),
                  ),
                  onFieldSubmitted: (_) async {
                    await checkForm(context, ref, usernameController,
                        passwordController, isLoading);
                  },
                ),
              ),
              // SizedBox(height: 15.h),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15.w),
              //   child: TextButton(
              //     onPressed: () {
              //       final appRouter = ref.read(appRouterProvider);
              //       appRouter.push(RouteURL.registerEmail);
              //     },
              //     child: Text(
              //       useL10n(theContext: context).registerEntryBtn,
              //       style: const TextStyle(
              //         color: WSColor.primaryFontColor,
              //       ),
              //     ),
              //   ),
              // ),
              const Spacer(flex: 2),
              SizedBox(
                width: 180.w,
                height: 40.h,
                child: WSLoadingButton(
                  onPressed: () async {
                    await checkForm(context, ref, usernameController,
                        passwordController, isLoading);
                  },
                  loading: isLoading.value,
                  child: Center(
                      child: Text(
                    useL10n(theContext: context).loginBtn,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  )),
                ),
              ),

              const Spacer(flex: 15),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkForm(
    BuildContext context,
    WidgetRef ref,
    TextEditingController usernameController,
    // FocusNode usernameFocus,
    TextEditingController passwordController,
    // FocusNode passwordFocus
    ValueNotifier<bool> isLoading,
  ) async {
    final appRouter = ref.read(appRouterProvider);
    final String username = usernameController.text.trim();
    final String password = passwordController.text.trim();

    // usernameFocus.unfocus();
    // passwordFocus.unfocus();

    if (formValidate(username, password)) {
      isLoading.value = true;

      try {
        final auth = await ref.read(
            authProvider(AuthParams(username: username, password: password))
                .future);
        if (auth != null &&
            (auth.isSuccess ?? false) &&
            isNotEmpty(auth.value?.token)) {
          final sessionManager = ref.read(sessionManagerProvider);
          await sessionManager.setUsername(username);
          await sessionManager.setPassword(password);
          await sessionManager.setToken(auth.value?.token ?? '');

          appRouter.go(RouteURL.main);
        } else if (auth != null &&
            !(auth.isSuccess ?? false) &&
            isNotEmpty(auth.failureReason)) {
          WSToast.show(auth.failureReason ?? '', gravity: ToastGravity.BOTTOM);
        }

        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
        handleException(GeneralException.toGeneralException(e as Exception),
            gravity: ToastGravity.BOTTOM);
      }
    } else {
      WSToast.show(
          '${useL10n(theContext: context).usernameEmptyErr}\n${useL10n(theContext: context).passwordEmptyErr}',
          gravity: ToastGravity.BOTTOM);
    }
  }

  bool formValidate(String username, String password) {
    if (isNotEmpty(username) && isNotEmpty(password)) {
      return true;
    }
    return false;
  }
}
