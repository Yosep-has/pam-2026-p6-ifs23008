// lib/app.dart

import 'package:flutter/material.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_notifier.dart';

class DelcomFarmApp extends StatefulWidget {
  const DelcomFarmApp({super.key});

  @override
  State<DelcomFarmApp> createState() => _DelcomFarmAppState();
}

class _DelcomFarmAppState extends State<DelcomFarmApp> {
  // ThemeNotifier dibuat di level tertinggi agar bisa diakses seluruh app
  final ThemeNotifier _themeNotifier = ThemeNotifier(initial: ThemeMode.light);

  @override
  void dispose() {
    _themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ThemeProvider membungkus seluruh app agar notifier bisa diakses di mana saja
    return ThemeProvider(
      notifier: _themeNotifier,
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: _themeNotifier,
        builder: (context, themeMode, child) {
          return MaterialApp.router(
            title: 'Delcom Farm',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
