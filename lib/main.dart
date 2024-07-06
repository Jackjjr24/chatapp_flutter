import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'services/auth/auth_gate.dart';
import 'services/theme_notifier.dart';  // Import ThemeNotifier
import 'themes/light_mode.dart';        // Import light mode theme
import 'themes/dark_mode.dart';         // Import dark mode theme

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),  // Create an instance of ThemeNotifier
      child: Consumer<ThemeNotifier>(       // Use Consumer to rebuild when theme changes
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const AuthGate(),         // Your home widget
            theme: themeNotifier.currentTheme,  // Use currentTheme from ThemeNotifier
          );
        },
      ),
    );
  }
}
