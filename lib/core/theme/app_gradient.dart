import 'package:flutter/cupertino.dart';

import 'colors.dart';

abstract class AppGradients {
  static LinearGradient backgroundGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        AppColors.primary,
        AppColors.primary.withOpacity(0.8),
        AppColors.primary.withOpacity(0.2),
        AppColors.primary.withOpacity(0.1),
        AppColors.primary.withOpacity(0.1),
      ]);
}
