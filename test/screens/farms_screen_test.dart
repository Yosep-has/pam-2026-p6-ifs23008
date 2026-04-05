// test/screens/farms_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pam_2026_p6_ifs23008/core/theme/app_theme.dart';
import 'package:pam_2026_p6_ifs23008/core/theme/theme_notifier.dart';
import 'package:pam_2026_p6_ifs23008/data/dummy_data.dart';
import 'package:pam_2026_p6_ifs23008/features/farm/farms_screen.dart';

Widget buildFarmsTest() {
  final notifier = ThemeNotifier(initial: ThemeMode.light);
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (_, __) => const FarmsScreen()),
    GoRoute(path: '/farm/:name', builder: (_, __) => const SizedBox()),
  ]);

  return ThemeProvider(
    notifier: notifier,
    child: MaterialApp.router(
      theme: AppTheme.lightTheme,
      routerConfig: router,
    ),
  );
}

void main() {
  group('FarmsScreen', () {
    testWidgets('merender tanpa error', (tester) async {
      await tester.pumpWidget(buildFarmsTest());
      await tester.pumpAndSettle();

      expect(find.byType(FarmsScreen), findsOneWidget);
    });

    testWidgets('menampilkan judul "Farm" di AppBar', (tester) async {
      await tester.pumpWidget(buildFarmsTest());
      await tester.pumpAndSettle();

      expect(find.text('Farm'), findsOneWidget);
    });

    testWidgets('menampilkan tombol search di AppBar', (tester) async {
      await tester.pumpWidget(buildFarmsTest());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('menampilkan hewan pertama dari DummyData', (tester) async {
      await tester.pumpWidget(buildFarmsTest());
      await tester.pumpAndSettle();

      final farms = DummyData.getFarmData();
      expect(find.text(farms.first.nama), findsOneWidget);
    });

    testWidgets('menampilkan list hewan menggunakan ListView', (tester) async {
      await tester.pumpWidget(buildFarmsTest());
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('fungsi search memfilter hewan berdasarkan nama',
            (tester) async {
          await tester.pumpWidget(buildFarmsTest());
          await tester.pumpAndSettle();

          // Buka search
          await tester.tap(find.byIcon(Icons.search));
          await tester.pumpAndSettle();

          // Ketik query
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
          expect(find.text('Ayam'), findsNothing);
        });

    testWidgets('menampilkan pesan saat tidak ada hasil pencarian',
            (tester) async {
          await tester.pumpWidget(buildFarmsTest());
          await tester.pumpAndSettle();

          await tester.tap(find.byIcon(Icons.search));
          await tester.pumpAndSettle();

          // Query yang tidak ada hasilnya
          await tester.enterText(find.byType(TextField), 'xyzabc123');
          await tester.pumpAndSettle();

          expect(find.text('Tidak ada data!'), findsOneWidget);
        });

    testWidgets('menutup search mereset daftar hewan', (tester) async {
      await tester.pumpWidget(buildFarmsTest());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Sapi');
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Scroll ke bawah sampai data terakhir
      await tester.scrollUntilVisible(
        find.text(DummyData.getFarmData().last.nama),
        500,
      );

      // Pastikan data terakhir tampil
      expect(
        find.text(DummyData.getFarmData().last.nama),
        findsOneWidget,
      );
    });
  });
}
