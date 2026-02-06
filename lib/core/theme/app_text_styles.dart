import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Stili di testo utilizzati nell'app
/// Centralizzati qui per mantenere consistenza visiva
class AppTextStyles {
  AppTextStyles._();

  // === TITOLI ===
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.3,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // === TESTO BODY ===
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // === TESTO SPECIALE ===
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnPrimary,
    letterSpacing: 0.5,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle weatherTemp = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnPrimary,
  );

  static const TextStyle weatherDay = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnPrimary,
  );

  static const TextStyle weatherDetail = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    color: AppColors.textOnPrimary,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.2,
  );

  static const TextStyle tabLabel = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
}
