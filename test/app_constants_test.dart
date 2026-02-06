// Test per le costanti dell'app Comune di Marcianise
// Verifica che tutte le costanti critiche siano definite correttamente

import 'package:flutter_test/flutter_test.dart';
import 'package:marcianise_app/core/constants/app_constants.dart';

void main() {
  group('AppConstants - Info Comune', () {
    test('Nome comune è corretto', () {
      expect(AppConstants.comuneNomeCompleto, 'Comune di Marcianise');
    });

    test('Indirizzo è Via Roma 18', () {
      expect(AppConstants.indirizzo, 'Via Roma, 18');
    });

    test('CAP è 81025', () {
      expect(AppConstants.cap, '81025');
    });

    test('Telefono centralino inizia con +39', () {
      expect(AppConstants.telefono, startsWith('+39'));
    });

    test('Email contiene @comune.marcianise', () {
      expect(AppConstants.email, contains('@comune.marcianise'));
    });

    test('PEC contiene @pec.comune.marcianise', () {
      expect(AppConstants.pec, contains('@pec.comune.marcianise'));
    });

    test('Sito web è HTTPS', () {
      expect(AppConstants.sitoWeb, startsWith('https://'));
    });
  });

  group('AppConstants - Telefoni Uffici', () {
    test('Telefono centralino è definito', () {
      expect(AppConstants.telefonoCentralino, isNotEmpty);
    });

    test('Telefono anagrafe è definito', () {
      expect(AppConstants.telefonoAnagrafe, isNotEmpty);
    });

    test('Telefono tributi è definito', () {
      expect(AppConstants.telefonoTributi, isNotEmpty);
    });

    test('Telefono polizia municipale è definito', () {
      expect(AppConstants.telefonoPoliziaMunicipale, isNotEmpty);
    });
  });

  group('AppConstants - URL Servizi Online', () {
    test('URL ANPR è HTTPS', () {
      expect(AppConstants.urlAnpr, startsWith('https://'));
    });

    test('URL PagoPA è HTTPS', () {
      expect(AppConstants.urlPagoPA, startsWith('https://'));
    });

    test('URL Albo Pretorio contiene marcianise', () {
      expect(AppConstants.urlAlboPretorio, contains('marcianise'));
    });
  });

  group('AppConstants - Dimensioni', () {
    test('Padding medium è 16', () {
      expect(AppConstants.paddingMedium, 16.0);
    });

    test('Border radius medium è 16', () {
      expect(AppConstants.borderRadiusMedium, 16.0);
    });

    test('Hero image height è 280', () {
      expect(AppConstants.heroImageHeight, 280.0);
    });
  });
}
