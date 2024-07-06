// services/theme_notifier.dart
import 'package:flutter/material.dart';
import '../themes/light_mode.dart';
import '../themes/dark_mode.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;
  ThemeData _currentTheme = lightMode;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _currentTheme = _isDarkMode ? darkMode : lightMode;
    notifyListeners();
  }
}
