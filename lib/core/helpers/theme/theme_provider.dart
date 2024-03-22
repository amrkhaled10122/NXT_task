import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/local/preference_manager.dart';

/// A class that provides theme-related functionality and manages the app's theme state.
class ThemeProvider extends ChangeNotifier {
  bool _darkTheme = false;
  late SharedPreferences _preferences;
  final String _themeKey = "theme";

  /// Indicates whether the app is currently in dark mode.
  bool get darkTheme => _darkTheme;

  /// Initializes the theme provider and loads theme preferences from shared preferences.
  ThemeProvider() {
    _loadFromPrefs();
  }

  /// Toggles between light and dark mode.
  void toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  /// Loads theme preferences from shared preferences.
  Future<void> _loadFromPrefs() async {
    _darkTheme = PreferencesManager.getBoolWithKey(_themeKey);
    notifyListeners();
  }

  /// Saves theme preferences to shared preferences.
  Future<void> _saveToPrefs() async {
    await _preferences.setBool(_themeKey, _darkTheme);
  }

  /// Retrieves the current theme mode.
  ThemeMode? get themeMode {
    if (_darkTheme) {
      return ThemeMode.dark;
    } else {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    }
  }
}
