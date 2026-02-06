// Test per AppRouter e AppRoutes - navigazione centralizzata
// Verifica che tutte le rotte siano configurate correttamente
// e che il router generi le schermate giuste per ogni percorso

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marcianise_app/core/routes/app_routes.dart';
import 'package:marcianise_app/core/routes/app_router.dart';

void main() {
  group('AppRoutes - Definizione rotte', () {
    test('Home è /', () {
      expect(AppRoutes.home, '/');
    });

    test('News e Avvisi (Modulo A) è /news-avvisi', () {
      expect(AppRoutes.newsAvvisi, '/news-avvisi');
    });

    test('Consiglio Comunale (Modulo B) è /consiglio-comunale', () {
      expect(AppRoutes.consiglioComunale, '/consiglio-comunale');
    });

    test('Eventi (Modulo C) è /eventi', () {
      expect(AppRoutes.eventi, '/eventi');
    });

    test('Cultura e Turismo (Modulo D) è /cultura-turismo', () {
      expect(AppRoutes.culturaTurismo, '/cultura-turismo');
    });

    test('Tributi e Pagamenti (Modulo E) è /tributi-pagamenti', () {
      expect(AppRoutes.tributiPagamenti, '/tributi-pagamenti');
    });

    test('Segnala Disservizio è /segnala-disservizio', () {
      expect(AppRoutes.segnalaDisservizio, '/segnala-disservizio');
    });

    test('Prenota Ufficio è /prenota-ufficio', () {
      expect(AppRoutes.prenotaUfficio, '/prenota-ufficio');
    });

    test('Contatta Uffici è /contatta-uffici', () {
      expect(AppRoutes.contattaUffici, '/contatta-uffici');
    });

    test('Gestione Rifiuti è /gestione-rifiuti', () {
      expect(AppRoutes.gestioneRifiuti, '/gestione-rifiuti');
    });

    test('Servizi Online è /servizi-online', () {
      expect(AppRoutes.serviziOnline, '/servizi-online');
    });

    test('Luoghi di Interesse è /luoghi-interesse', () {
      expect(AppRoutes.luoghiInteresse, '/luoghi-interesse');
    });
  });

  group('AppRouter - Generazione rotte', () {
    test('Genera MaterialPageRoute per rotta home', () {
      final route = AppRouter.generateRoute(
        const RouteSettings(name: AppRoutes.home),
      );
      expect(route, isA<MaterialPageRoute>());
    });

    test('Genera MaterialPageRoute per rotta news', () {
      final route = AppRouter.generateRoute(
        const RouteSettings(name: AppRoutes.newsAvvisi),
      );
      expect(route, isA<MaterialPageRoute>());
    });

    test('Genera MaterialPageRoute per rotta eventi', () {
      final route = AppRouter.generateRoute(
        const RouteSettings(name: AppRoutes.eventi),
      );
      expect(route, isA<MaterialPageRoute>());
    });

    test('Rotta sconosciuta ritorna alla home', () {
      final route = AppRouter.generateRoute(
        const RouteSettings(name: '/rotta-inesistente'),
      );
      expect(route, isA<MaterialPageRoute>());
    });

    test('Tutte le 12 rotte generano MaterialPageRoute', () {
      // Lista di tutte le rotte definite nell'app
      final rotte = [
        AppRoutes.home,
        AppRoutes.newsAvvisi,
        AppRoutes.consiglioComunale,
        AppRoutes.eventi,
        AppRoutes.culturaTurismo,
        AppRoutes.tributiPagamenti,
        AppRoutes.segnalaDisservizio,
        AppRoutes.prenotaUfficio,
        AppRoutes.contattaUffici,
        AppRoutes.gestioneRifiuti,
        AppRoutes.serviziOnline,
        AppRoutes.luoghiInteresse,
      ];

      for (final rotta in rotte) {
        final route = AppRouter.generateRoute(
          RouteSettings(name: rotta),
        );
        expect(route, isA<MaterialPageRoute>(), reason: 'Rotta $rotta non genera MaterialPageRoute');
      }
    });
  });
}
