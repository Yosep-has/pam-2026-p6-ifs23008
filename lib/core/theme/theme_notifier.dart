// lib/core/theme/theme_notifier.dart

import 'package:flutter/material.dart';

/// ValueNotifier untuk mengelola ThemeMode secara reaktif
class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier({required ThemeMode initial}) : super(initial);

  bool get isDark => value == ThemeMode.dark;

  void toggle() {
    value = isDark ? ThemeMode.light : ThemeMode.dark;
  }
}

/// InheritedWidget untuk menyebarkan ThemeNotifier ke seluruh widget tree
class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    super.key,
    required this.notifier,
    required super.child,
  });

  final ThemeNotifier notifier;

  static ThemeNotifier of(BuildContext context) {
    final provider =
    context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    assert(provider != null, 'ThemeProvider not found in widget tree');
    return provider!.notifier;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) =>
      notifier != oldWidget.notifier;
}
