import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_ui_ux_kuis/main.dart';

void main() {
  testWidgets('App starts and shows navigation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp()); // HAPUS const

    // Verify that app starts with Product Grid page
    expect(find.text('Produk Grid'), findsOneWidget);
    expect(find.byIcon(Icons.grid_view), findsOneWidget);
    
    // Verify navigation items exist
    expect(find.text('Grid'), findsOneWidget);
    expect(find.text('Profil'), findsOneWidget);
    expect(find.text('Kontak'), findsOneWidget);
    expect(find.text('Dashboard'), findsOneWidget);
  });

  testWidgets('Navigation between pages works', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Tap on Profile tab
    await tester.tap(find.text('Profil'));
    await tester.pumpAndSettle();

    // Verify Profile page is shown
    expect(find.text('Profil Mahasiswa'), findsOneWidget);
    expect(find.text('Ahmad Rizki Pratama'), findsOneWidget);

    // Tap on Contact tab
    await tester.tap(find.text('Kontak'));
    await tester.pumpAndSettle();

    // Verify Contact page is shown
    expect(find.text('Daftar Kontak'), findsOneWidget);
    expect(find.text('Budi Santoso'), findsOneWidget);
  });
}