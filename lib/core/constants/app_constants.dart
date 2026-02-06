/// Costanti globali dell'applicazione
/// Nome comune, URL, dimensioni, ecc.
class AppConstants {
  AppConstants._();

  // === INFO COMUNE ===
  static const String comuneNome = 'Comune di';
  static const String comuneCitta = 'MARCIANISE';
  static const String comuneNomeCompleto = 'Comune di Marcianise';

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
