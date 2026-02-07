import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Stili di testo utilizzati nell'app
/// Centralizzati qui per mantenere consistenza visiva
class AppTextStyles {
  AppTextStyles._();

  // === TITOLI ===
  static TextStyle get heading1 => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static TextStyle get heading2 => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.3,
  );

  static TextStyle get heading3 => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // === TESTO BODY ===
  static TextStyle get bodyLarge => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodySmall => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // === TESTO SPECIALE ===
  static TextStyle get appBarTitle => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnPrimary,
    letterSpacing: 0.5,
  );

  static TextStyle get cardTitle => TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle get weatherTemp => const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnPrimary,
  );

  static TextStyle get weatherDay => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnPrimary,
  );

  static TextStyle get weatherDetail => const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    color: AppColors.textOnPrimary,
  );

  static TextStyle get sectionTitle => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.2,
  );

  static TextStyle get tabLabel => const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
}
