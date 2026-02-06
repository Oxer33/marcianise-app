// Test widget per la HomeScreen dell'app Comune di Marcianise
// Verifica che la home page si carichi correttamente con tutti i componenti

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marcianise_app/main.dart';

void main() {
  testWidgets('Home mostra AppBar con titolo Comune di MARCIANISE',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MarcianiseApp());

    // Verifica che il titolo "Comune di" sia presente nell'AppBar
    expect(find.text('Comune di'), findsOneWidget);
    // Verifica che il sottotitolo "MARCIANISE" sia presente
    expect(find.text('MARCIANISE'), findsOneWidget);
  });

  testWidgets('Home mostra icona menu hamburger', (WidgetTester tester) async {
    await tester.pumpWidget(const MarcianiseApp());

    // Verifica che l'icona menu sia presente
    expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
  });

  testWidgets('Home mostra icona notifiche', (WidgetTester tester) async {
    await tester.pumpWidget(const MarcianiseApp());

    // Verifica che l'icona notifiche sia presente
    expect(find.byIcon(Icons.notifications_outlined), findsOneWidget);
  });

  testWidgets('Home mostra tab Novità e Eventi', (WidgetTester tester) async {
    await tester.pumpWidget(const MarcianiseApp());
    await tester.pumpAndSettle();

    // Verifica che i tab siano presenti
    expect(find.text('Novità'), findsOneWidget);
    expect(find.text('Eventi'), findsOneWidget);
  });
}
