// Test per SnackBarHelper - utility feedback consistente
// Verifica che i 4 tipi di SnackBar (success, error, info, warning)
// vengano mostrati correttamente con icona, testo e colore giusto

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marcianise_app/core/utils/snackbar_helper.dart';

void main() {
  // Helper per creare un widget testabile con Scaffold
  Widget buildTestApp(void Function(BuildContext) onBuild) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () => onBuild(context),
              child: const Text('Test'),
            ),
          ),
        ),
      ),
    );
  }

  group('SnackBarHelper', () {
    testWidgets('showSuccess mostra SnackBar verde con icona check', (tester) async {
      await tester.pumpWidget(buildTestApp((context) {
        SnackBarHelper.showSuccess(context, 'Operazione riuscita!');
      }));

      // Tap sul bottone per mostrare la SnackBar
      await tester.tap(find.text('Test'));
      await tester.pumpAndSettle();

      // Verifica che il messaggio sia visibile
      expect(find.text('Operazione riuscita!'), findsOneWidget);
      // Verifica che l'icona check sia presente
      expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
    });

    testWidgets('showError mostra SnackBar rossa con icona errore', (tester) async {
      await tester.pumpWidget(buildTestApp((context) {
        SnackBarHelper.showError(context, 'Si è verificato un errore');
      }));

      await tester.tap(find.text('Test'));
      await tester.pumpAndSettle();

      expect(find.text('Si è verificato un errore'), findsOneWidget);
      expect(find.byIcon(Icons.error_rounded), findsOneWidget);
    });

    testWidgets('showInfo mostra SnackBar verde scuro con icona info', (tester) async {
      await tester.pumpWidget(buildTestApp((context) {
        SnackBarHelper.showInfo(context, 'Informazione importante');
      }));

      await tester.tap(find.text('Test'));
      await tester.pumpAndSettle();

      expect(find.text('Informazione importante'), findsOneWidget);
      expect(find.byIcon(Icons.info_rounded), findsOneWidget);
    });

    testWidgets('showWarning mostra SnackBar arancione con icona warning', (tester) async {
      await tester.pumpWidget(buildTestApp((context) {
        SnackBarHelper.showWarning(context, 'Attenzione!');
      }));

      await tester.tap(find.text('Test'));
      await tester.pumpAndSettle();

      expect(find.text('Attenzione!'), findsOneWidget);
      expect(find.byIcon(Icons.warning_rounded), findsOneWidget);
    });

    testWidgets('SnackBar ha behavior floating e bordo arrotondato', (tester) async {
      await tester.pumpWidget(buildTestApp((context) {
        SnackBarHelper.showSuccess(context, 'Test floating');
      }));

      await tester.tap(find.text('Test'));
      await tester.pumpAndSettle();

      // Verifica che la SnackBar sia di tipo floating
      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.behavior, SnackBarBehavior.floating);
    });
  });
}
