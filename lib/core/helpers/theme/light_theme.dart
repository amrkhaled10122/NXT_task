import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';

/// A class representing the light theme of the application.
class LightTheme extends AppTheme {
  late SystemUiOverlayStyle lightStatusBar;

  /// Constructs a LightTheme instance with the provided app colors.

  LightTheme({required super.appColors}) : super(typography: Typography.blackCupertino) {
    lightStatusBar = SystemUiOverlayStyle(
      statusBarIconBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
      statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
    ).copyWith(statusBarColor: appColors.scaffoldBackgroundColor);

    super.statusBar = lightStatusBar;
  }

  @override
  ThemeData get theme => super.theme.copyWith(
        radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) => appColors.primary,
          ),
        ),
      );
}
