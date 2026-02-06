/// Costanti globali dell'applicazione
/// Nome comune, contatti, URL, dimensioni, ecc.
/// Dati reali dal sito www.comune.marcianise.ce.it
class AppConstants {
  AppConstants._();

  // === INFO COMUNE ===
  static const String comuneNome = 'Comune di';
  static const String comuneCitta = 'MARCIANISE';
  static const String comuneNomeCompleto = 'Comune di Marcianise';

  // === CONTATTI REALI (dal sito ufficiale) ===
  static const String indirizzo = 'Via Roma, 18';
  static const String cap = '81025';
  static const String citta = 'Marcianise (CE)';
  static const String indirizzoCompleto = 'Via Roma, 18 - 81025 Marcianise (CE)';
  static const String telefono = '+39 0823 635111';
  static const String email = 'info@comune.marcianise.ce.it';
  static const String pec = 'protocollo@pec.comune.marcianise.ce.it';
  static const String codiceFiscale = '93012960618';
  static const String partitaIva = '00237550611';
  static const String sitoWeb = 'https://www.comune.marcianise.ce.it';
  static const String facebook = 'https://www.facebook.com/marcianiseofficial/';
  static const String instagram = 'https://www.instagram.com/cittadimarcianiseufficiale/';
  static const String youtube = 'https://www.youtube.com/channel/UCglEv_b7yTzb1hVB2HxYeGQ/videos';

  // === DIMENSIONI ===
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 16.0;
  static const double borderRadiusLarge = 24.0;

  static const double iconSizeSmall = 20.0;
  static const double iconSizeMedium = 28.0;
  static const double iconSizeLarge = 48.0;

  // === HERO IMAGE ===
  static const double heroImageHeight = 280.0;

  // === SERVIZI GRID ===
  static const int serviziCrossAxisCount = 3;
  static const double serviziSpacing = 12.0;

  // === ANIMAZIONI ===
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 350);
  static const Duration animationSlow = Duration(milliseconds: 500);
}
