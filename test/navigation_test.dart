// Test navigazione tra schermate dell'app Comune di Marcianise
// Verifica che il drawer si apra e che le rotte funzionino

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marcianise_app/main.dart';

void main() {
  testWidgets('Drawer si apre con tap su menu hamburger',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MarcianiseApp());

    // Tap sull'icona menu
    await tester.tap(find.byIcon(Icons.menu_rounded));
    await tester.pumpAndSettle();

    // Verifica che il drawer sia aperto (contiene "Home" come primo item)
    expect(find.text('Home'), findsWidgets);
  });

  testWidgets('Drawer contiene i primi moduli visibili',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MarcianiseApp());

    // Apri il drawer
    await tester.tap(find.byIcon(Icons.menu_rounded));
    await tester.pumpAndSettle();

    // Verifica che i moduli visibili siano presenti nel drawer
    expect(find.text('News e Avvisi'), findsOneWidget);
    expect(find.text('Consiglio Comunale'), findsOneWidget);
    // "Eventi e Manifestazioni" è il testo corretto nel drawer
    expect(find.text('Eventi e Manifestazioni'), findsOneWidget);
  });

  testWidgets('Navigazione a News e Avvisi dal drawer',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MarcianiseApp());

    // Apri il drawer
    await tester.tap(find.byIcon(Icons.menu_rounded));
    await tester.pumpAndSettle();

    // Tap su "News e Avvisi"
    await tester.tap(find.text('News e Avvisi'));
    await tester.pumpAndSettle();

    // Verifica che siamo nella schermata News (AppBar con titolo)
    expect(find.text('News e Avvisi'), findsWidgets);
  });

  testWidgets('Drawer mostra etichetta Moduli Principali',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MarcianiseApp());

    // Apri il drawer
    await tester.tap(find.byIcon(Icons.menu_rounded));
    await tester.pumpAndSettle();

    // Verifica che l'etichetta sezione sia presente
    expect(find.text('MODULI PRINCIPALI'), findsOneWidget);
  });
}
