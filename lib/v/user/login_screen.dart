import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_widgets/color.dart';
import 'login_form.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: WSColor.primaryBgColor,
      child: const SafeArea(
        left: false,
        right: false,
        child: Scaffold(
          backgroundColor: WSColor.primaryBgColor,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
