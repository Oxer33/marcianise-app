// Test base dell'app Comune di Marcianise
// Verifica che l'app si avvii correttamente

import 'package:flutter_test/flutter_test.dart';
import 'package:marcianise_app/main.dart';

void main() {
  testWidgets('App si avvia correttamente', (WidgetTester tester) async {
    // Avvia l'app
    await tester.pumpWidget(const MarcianiseApp());

    // Verifica che il titolo "Comune di" sia presente
    expect(find.textContaining('Comune di'), findsWidgets);
  });
}
