import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// Colori principali dell'app Comune di Marcianise
/// Tema VERDE SCURO istituzionale come il sito www.comune.marcianise.ce.it
class AppColors {
  AppColors._(); // Costruttore privato - classe non istanziabile

  // === COLORI PRIMARI (Verde scuro istituzionale) ===
  static const Color primary = Color(0xFF008055);       // Verde scuro istituzionale
  static const Color primaryDark = Color(0xFF005C3E);   // Verde molto scuro
  static const Color primaryLight = Color(0xFF4CAF82);  // Verde chiaro
  static const Color accent = Color(0xFF66BB6A);        // Verde accent

  // === COLORI SFONDO (LIGHT/DARK) ===
  static const Color backgroundLight = Color(0xFFF5FFF8); // Sfondo verdino chiaro
  static const Color backgroundDark = Color(0xFF0F1A14);  // Sfondo dark verde profondo

  static const Color surfaceLight = Colors.white; // Superficie card (light)
  static const Color surfaceDark = Color(0xFF16251C); // Superficie card (dark)

  static const Color scaffoldBgLight = Color(0xFFEEF7F0); // Sfondo scaffold (light)
  static const Color scaffoldBgDark = Color(0xFF0E1913);  // Sfondo scaffold (dark)

  // === COLORI TESTO (LIGHT/DARK) ===
  static const Color textPrimaryLight = Color(0xFF1A2E1A);  // Testo principale scuro
  static const Color textPrimaryDark = Color(0xFFE6F5ED);   // Testo principale chiaro

  static const Color textSecondaryLight = Color(0xFF6B7B6D); // Testo secondario grigio-verde
  static const Color textSecondaryDark = Color(0xFFB7C7BC);  // Testo secondario chiaro

  static const Color textOnPrimary = Colors.white; // Testo su sfondo primario

  // === GETTER DINAMICI (seguono il tema di sistema) ===
  static bool get _isDarkMode {
    final brightness = ui.PlatformDispatcher.instance.platformBrightness;
    return brightness == Brightness.dark;
  }

  static Color get background => _isDarkMode ? backgroundDark : backgroundLight;
  static Color get surface => _isDarkMode ? surfaceDark : surfaceLight;
  static Color get scaffoldBg => _isDarkMode ? scaffoldBgDark : scaffoldBgLight;
  static Color get textPrimary => _isDarkMode ? textPrimaryDark : textPrimaryLight;
  static Color get textSecondary => _isDarkMode ? textSecondaryDark : textSecondaryLight;

  // === COLORI CARD SERVIZI (5 moduli del progetto) ===
  static const Color cardService1 = Color(0xFFE8F5E9);  // Verde chiaro - Comunicazioni
  static const Color cardService2 = Color(0xFFE0F2F1);  // Teal chiaro - Consiglio
  static const Color cardService3 = Color(0xFFFFF3E0);  // Arancione chiaro - Eventi
  static const Color cardService4 = Color(0xFFE3F2FD);  // Blu chiaro - Cultura
  static const Color cardService5 = Color(0xFFFCE4EC);  // Rosa chiaro - Tributi
  static const Color cardService6 = Color(0xFFF3E5F5);  // Viola chiaro - Segnalazioni

  // === COLORI STATO ===
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // === GRADIENTE HEADER ===
  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryDark, primary],
  );

  // === OMBRA CARD ===
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: _isDarkMode ? 0.35 : 0.08),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  // === OMBRA CARD HOVER (piu' profonda) ===
  static List<BoxShadow> get cardShadowHover => [
    BoxShadow(
      color: Colors.black.withValues(alpha: _isDarkMode ? 0.5 : 0.14),
      blurRadius: 18,
      offset: const Offset(0, 8),
    ),
  ];
}
