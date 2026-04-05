// test/widget/loading_widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pam_2026_p6_ifs23008/shared/widgets/loading_widget.dart';

void main() {
  group('LoadingWidget', () {
    testWidgets('merender tanpa error', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LoadingWidget()),
        ),
      );

      expect(find.byType(LoadingWidget), findsOneWidget);
    });

    testWidgets('menampilkan Stack sebagai container animasi', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LoadingWidget()),
        ),
      );

      expect(find.byType(Stack), findsWidgets);
    });

    testWidgets('menampilkan gambar atau ikon hewan di tengah', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LoadingWidget()),
        ),
      );

      // Gambar ayam atau fallback ikon pets
      final hasImage = tester.widgetList(find.byType(Image)).isNotEmpty;
      final hasIcon = tester.widgetList(find.byIcon(Icons.pets)).isNotEmpty;
      expect(hasImage || hasIcon, isTrue);
    });

    testWidgets('widget berada di posisi tengah layar', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LoadingWidget()),
        ),
      );

      expect(find.byType(Center), findsWidgets);
    });

    testWidgets('menampilkan animasi ripple (AnimatedBuilder)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LoadingWidget()),
        ),
      );

      expect(find.byType(AnimatedBuilder), findsWidgets);
    });
  });
}
