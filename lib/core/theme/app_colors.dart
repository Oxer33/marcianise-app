import 'package:flutter/material.dart';

/// Colori principali dell'app Comune di Marcianise
/// Tema blu ispirato all'app di riferimento
class AppColors {
  AppColors._(); // Costruttore privato - classe non istanziabile

  // === COLORI PRIMARI ===
  static const Color primary = Color(0xFF1565C0);       // Blu primario
  static const Color primaryDark = Color(0xFF0D47A1);   // Blu scuro
  static const Color primaryLight = Color(0xFF42A5F5);  // Blu chiaro
  static const Color accent = Color(0xFF29B6F6);        // Azzurro accent

  // === COLORI SFONDO ===
  static const Color background = Color(0xFFF5F9FF);    // Sfondo azzurrino chiaro
  static const Color surface = Colors.white;             // Superficie card
  static const Color scaffoldBg = Color(0xFFEEF4FB);    // Sfondo scaffold

  // === COLORI TESTO ===
  static const Color textPrimary = Color(0xFF1A1A2E);   // Testo principale scuro
  static const Color textSecondary = Color(0xFF6B7280);  // Testo secondario grigio
  static const Color textOnPrimary = Colors.white;       // Testo su sfondo primario

  // === COLORI CARD SERVIZI ===
  static const Color cardService1 = Color(0xFFE3F2FD);  // Azzurro chiaro per card
  static const Color cardService2 = Color(0xFFE8F5E9);  // Verde chiaro per card
  static const Color cardService3 = Color(0xFFFFF3E0);  // Arancione chiaro per card
  static const Color cardService4 = Color(0xFFFCE4EC);  // Rosa chiaro per card
  static const Color cardService5 = Color(0xFFE0F7FA);  // Ciano chiaro per card
  static const Color cardService6 = Color(0xFFF3E5F5);  // Viola chiaro per card

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
