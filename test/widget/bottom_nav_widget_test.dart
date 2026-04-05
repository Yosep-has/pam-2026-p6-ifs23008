// test/widget/bottom_nav_widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pam_2026_p6_ifs23008/core/theme/app_theme.dart';
import 'package:pam_2026_p6_ifs23008/core/theme/theme_notifier.dart';
import 'package:pam_2026_p6_ifs23008/shared/widgets/bottom_nav_widget.dart';

Widget buildNavTestApp(String initialRoute) {
  final notifier = ThemeNotifier(initial: ThemeMode.light);
  final router = GoRouter(
    initialLocation: initialRoute,
    routes: [
      ShellRoute(
        builder: (context, state, child) => Scaffold(
          body: child,
          bottomNavigationBar: BottomNavWidget(child: child),
        ),
        routes: [
          GoRoute(path: '/', builder: (_, __) => const SizedBox(key: Key('home'))),
          GoRoute(path: '/farm', builder: (_, __) => const SizedBox(key: Key('farm'))),
          GoRoute(path: '/profile', builder: (_, __) => const SizedBox(key: Key('profile'))),
        ],
      ),
    ],
  );

  return ThemeProvider(
    notifier: notifier,
    child: MaterialApp.router(
      theme: AppTheme.lightTheme,
      routerConfig: router,
    ),
  );
}

void main() {
  group('BottomNavWidget', () {
    testWidgets('merender tiga item navigasi', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/'));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Farm'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('menampilkan ikon home aktif di halaman home', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('menampilkan ikon agriculture untuk menu Farm', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/'));
      await tester.pumpAndSettle();

      // Ikon farm (tidak aktif)
      expect(find.byIcon(Icons.agriculture_outlined), findsOneWidget);
    });

    testWidgets('menekan Farm menavigasi ke halaman Farm', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Farm'));
      await tester.pumpAndSettle();

      // Halaman farm dirender
      expect(find.byKey(const Key('farm')), findsOneWidget);
    });

    testWidgets('menekan Profile menavigasi ke halaman Profile', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('profile')), findsOneWidget);
    });

    testWidgets('menampilkan NavigationBar sebagai bottom bar', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/'));
      await tester.pumpAndSettle();

      expect(find.byType(NavigationBar), findsOneWidget);
    });

    testWidgets('ikon Farm aktif saat di halaman Farm', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/farm'));
      await tester.pumpAndSettle();

      // Ikon aktif (filled)
      expect(find.byIcon(Icons.agriculture), findsOneWidget);
    });
  });
}
