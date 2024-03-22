import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.g.dart';

/// [ContextExtensions] is a class that contains all context extensions.
extension ContextExtensions on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;

  /// [orientation] is a [Orientation] that contains information about screen orientation.
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// [theme] is a [ThemeData] that contains information about screen theme.
  ThemeData get theme => Theme.of(this);

  /// [textTheme] is a [TextTheme] that contains information about screen text theme.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// [hideKeyBoard] is a Void to close opening keyboard when the user click on any empty space in the screen
  void get hideKeyBoard => FocusScope.of(this).requestFocus(FocusNode());
}
