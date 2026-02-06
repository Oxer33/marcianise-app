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

  // === COLORI SFONDO ===
  static const Color background = Color(0xFFF5FFF8);    // Sfondo verdino chiaro
  static const Color surface = Colors.white;             // Superficie card
  static const Color scaffoldBg = Color(0xFFEEF7F0);    // Sfondo scaffold

  // === COLORI TESTO ===
  static const Color textPrimary = Color(0xFF1A2E1A);   // Testo principale scuro
  static const Color textSecondary = Color(0xFF6B7B6D);  // Testo secondario grigio-verde
  static const Color textOnPrimary = Colors.white;       // Testo su sfondo primario

  // === COLORI CARD SERVIZI (5 moduli del progetto) ===
  static const Color cardService1 = Color(0xFFE8F5E9);  // Verde chiaro - Comunicazioni
  static const Color cardService2 = Color(0xFFE0F2F1);  // Teal chiaro - Consiglio
  static const Color cardService3 = Color(0xFFFFF3E0);  // Arancione chiaro - Eventi
  static const Color cardService4 = Color(0xFFE3F2FD);  // Azzurro chiaro - Cultura
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
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];
}
