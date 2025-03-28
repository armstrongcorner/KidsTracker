import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: false,
    platform: TargetPlatform.iOS,
    brightness: Brightness.light,
    primarySwatch: AppColors.primarySwatch,
    primaryColor: AppColors.primary,
    unselectedWidgetColor: AppColors.hint,
    disabledColor: AppColors.disabled,
    scaffoldBackgroundColor: AppColors.background,
    hintColor: AppColors.hint,
    dividerColor: AppColors.border,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.textOnPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.textOnPrimary,
      error: AppColors.error,
      shadow: AppColors.border,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      // titleTextStyle: typographies.body,
      centerTitle: true,
      color: AppColors.primary,
      foregroundColor: Colors.white,
      surfaceTintColor: AppColors.text,
      // titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.sp),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.text,
      unselectedLabelColor: AppColors.text.withOpacity(0.4),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.border,
      thickness: 1,
      space: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size.zero),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: const BorderRadius.all(Radius.circular(30)).r),
        ),
        backgroundColor: const WidgetStatePropertyAll(AppColors.accent1),
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size.zero),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: const BorderRadius.all(Radius.circular(30)).r),
        ),
        foregroundColor: const WidgetStatePropertyAll(AppColors.accent1),
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        side: const WidgetStatePropertyAll(BorderSide(color: AppColors.accent1)),
        // side: BorderSide(color: AppColors.accent1),
      ),
    ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: OutlinedButton.styleFrom(
    //     side: const BorderSide(color: Colors.green, width: 1.5),
    //     disabledForegroundColor: Colors.grey,
    //     foregroundColor: Colors.green,
    //     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
    //     textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    //   ),
    // ),
    // textButtonTheme: const TextButtonThemeData(
    //   style: ButtonStyle(
    //     foregroundColor: WidgetStatePropertyAll(AppColors.accent1),
    //     minimumSize: WidgetStatePropertyAll(Size.zero),
    //     padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 5, horizontal: 24)),
    //     shape: WidgetStatePropertyAll(
    //       RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    //     ),
    //     textStyle: WidgetStatePropertyAll(
    //       TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.5, color: AppColors.secondary),
    //     ),
    //   ),
    // ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 0.5,
      // margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0.r)),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: _getTextStyle(
        fontSize: 20.sp,
        color: AppColors.text,
      ),
      titleMedium: _getTextStyle(
        fontSize: 18.sp,
        color: AppColors.text,
      ),
      titleSmall: _getTextStyle(
        fontSize: 16.sp,
        color: AppColors.text,
      ),
      bodyLarge: _getTextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.bodyText,
      ),
      bodyMedium: _getTextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.bodyText,
      ),
      bodySmall: _getTextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.bodyText,
      ),
    ),
  );
}

TextStyle _getTextStyle({
  required double fontSize,
  FontWeight fontWeight = FontWeight.w600,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
