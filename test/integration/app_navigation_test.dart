// test/integration/app_navigation_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pam_2026_p6_ifs23008/app.dart';

void main() {
  group('Navigasi Aplikasi (End-to-End)', () {
    testWidgets('aplikasi berjalan dan menampilkan HomeScreen', (tester) async {
      await tester.pumpWidget(const DelcomFarmApp());
      await tester.pumpAndSettle();

      // Halaman awal adalah Home
      expect(find.widgetWithText(AppBar, 'Home'), findsOneWidget);
    });

    testWidgets('navigasi dari Home ke Farm via BottomNav', (tester) async {
      await tester.pumpWidget(const DelcomFarmApp());
      await tester.pumpAndSettle();

      // Tap Farm di bottom nav
      await tester.tap(find.text('Farm'));
      await tester.pumpAndSettle();

      // Halaman Farm muncul
      expect(find.text('Farm'), findsWidgets);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('navigasi dari Home ke Profile via BottomNav', (tester) async {
      await tester.pumpWidget(const DelcomFarmApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      expect(find.text('Tentang Saya'), findsOneWidget);
    });

    testWidgets('toggle dark mode mengubah tema aplikasi', (tester) async {
      await tester.pumpWidget(const DelcomFarmApp());
      await tester.pumpAndSettle();

      // Awalnya light mode
      expect(find.byIcon(Icons.light_mode_outlined), findsOneWidget);

      // Toggle ke dark mode
      await tester.tap(find.byIcon(Icons.light_mode_outlined));
      await tester.pumpAndSettle();

      // Ikon berubah ke dark mode
      expect(find.byIcon(Icons.dark_mode_outlined), findsOneWidget);
    });

    testWidgets('toggle dark mode tetap aktif saat berpindah halaman',
            (tester) async {
          await tester.pumpWidget(const DelcomFarmApp());
          await tester.pumpAndSettle();

          // Aktifkan dark mode di Home
          await tester.tap(find.byIcon(Icons.light_mode_outlined));
          await tester.pumpAndSettle();

          // Pindah ke Farm
          await tester.tap(find.text('Farm'));
          await tester.pumpAndSettle();

          // Ikon tetap dark_mode
          expect(find.byIcon(Icons.dark_mode_outlined), findsOneWidget);
        });

    testWidgets('pencarian di halaman Farm dapat menemukan hewan ternak',
            (tester) async {
          await tester.pumpWidget(const DelcomFarmApp());
          await tester.pumpAndSettle();

          // Navigasi ke Farm
          await tester.tap(find.byKey(const Key('Farm')));
          await tester.pumpAndSettle();

          // Buka search
          await tester.tap(find.byIcon(Icons.search));
          await tester.pumpAndSettle();

          // Ketik nama hewan
          await tester.enterText(find.byType(TextField), 'Sapi');
          await tester.pumpAndSettle();

          // Hanya Sapi yang tampil
          expect(
            find.descendant(
              of: find.byType(ListView),
              matching: find.text('Sapi'),
            ),
            findsOneWidget,
          );
        });

    testWidgets('navigasi kembali ke Home dari Farm menggunakan BottomNav',
            (tester) async {
          await tester.pumpWidget(const DelcomFarmApp());
          await tester.pumpAndSettle();

          // Navigasi ke Farm
          await tester.tap(find.byKey(const Key('Farm')));
          await tester.pumpAndSettle();

          // Kembali ke Home
          await tester.tap(find.text('Home'));
          await tester.pumpAndSettle();

          // Home ditampilkan
          expect(find.textContaining('Delcom Farm'), findsOneWidget);
        });
  });
}
