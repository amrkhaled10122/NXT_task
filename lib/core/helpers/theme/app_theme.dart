import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/app_colors.dart';

/// Represents the theme of the application.
class AppTheme {
  final AppColors appColors;
  final TextTheme typography;
  SystemUiOverlayStyle? statusBar;

  /// Constructs an instance of [AppTheme].
  ///
  /// [appColors]: Object containing color constants used in the theme.
  /// [typography]: Text theme used in the theme.
  /// [statusBar]: System UI overlay style for the status bar.
  AppTheme({
    required this.appColors,
    required this.typography,
    this.statusBar,
  }) {
    // Default status bar style with dark icons and background color matching the app's background color
    statusBar = const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ).copyWith(
      statusBarColor: appColors.background,
    );
  }

  /// Retrieves the theme data.
  ThemeData get theme => ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: appColors.primary,
          onPrimary: Colors.white,
          secondary: appColors.tertiary,
          onSecondary: Colors.white,
          error: appColors.red,
          onError: Colors.white,
          background: appColors.background,
          onBackground: appColors.textOnBackGround,
          surface: appColors.background,
          onSurface: appColors.textOnButton,
          tertiaryContainer: appColors.darkTertiary,
          outline: appColors.darkHint,
          surfaceVariant: appColors.lighterContainerColor,
        ),
        dividerTheme: DividerThemeData(
          color: appColors.borderColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: statusBar,
          iconTheme: IconThemeData(
            color: appColors.textOnBackGround,
          ),
        ),
        iconTheme: IconThemeData(
          color: appColors.textOnBackGround,
        ),
        scaffoldBackgroundColor: appColors.scaffoldBackgroundColor,
        cardColor: appColors.cardColor,
        cardTheme: CardTheme(color: appColors.cardColor),
        hintColor: appColors.hintColor,
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: appColors.navBarColor,
        ),
        indicatorColor: appColors.indicatorColor,
        primaryTextTheme: const TextTheme(
          displaySmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ).apply(
          fontFamily: "SFDisplay",
          displayColor: appColors.textOnBackGround,
          bodyColor: appColors.textOnBackGround,
        ),
      );
}
