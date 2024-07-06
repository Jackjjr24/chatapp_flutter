// pages/settings_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/theme_notifier.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return SwitchListTile(
            title: Text("Dark Mode"),
            value: themeNotifier.currentTheme.brightness == Brightness.dark,
            onChanged: (value) {
              themeNotifier.toggleTheme();
            },
          );
        },
      ),
    );
  }
}
