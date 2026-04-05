// test/unit/theme_notifier_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pam_2026_p6_ifs23008/core/theme/theme_notifier.dart';

void main() {
  group('ThemeNotifier', () {
    late ThemeNotifier notifier;

    setUp(() {
      // Buat instance baru sebelum setiap test
      notifier = ThemeNotifier(initial: ThemeMode.system);
    });

    tearDown(() {
      notifier.dispose();
    });

    test('nilai awal sesuai parameter initial', () {
      expect(notifier.value, equals(ThemeMode.system));
      expect(notifier.isDark, isFalse);
    });

    test('isDark mengembalikan true saat mode adalah dark', () {
      notifier = ThemeNotifier(initial: ThemeMode.dark);
      expect(notifier.isDark, isTrue);
    });

    test('isDark mengembalikan false saat mode adalah light', () {
      notifier = ThemeNotifier(initial: ThemeMode.light);
      expect(notifier.isDark, isFalse);
    });

    test('toggle dari light ke dark', () {
      notifier = ThemeNotifier(initial: ThemeMode.light);
      notifier.toggle();
      expect(notifier.value, equals(ThemeMode.dark));
    });

    test('toggle dari dark ke light', () {
      notifier = ThemeNotifier(initial: ThemeMode.dark);
      notifier.toggle();
      expect(notifier.value, equals(ThemeMode.light));
    });

    test('toggle dua kali kembali ke light', () {
      notifier = ThemeNotifier(initial: ThemeMode.light);
      notifier.toggle();
      notifier.toggle();
      expect(notifier.value, equals(ThemeMode.light));
    });

    test('notifier memanggil listener saat value berubah', () {
      int callCount = 0;
      notifier = ThemeNotifier(initial: ThemeMode.light);
      notifier.addListener(() => callCount++);

      notifier.toggle();
      notifier.toggle();

      expect(callCount, equals(2));
    });
  });
}
