// Test per il tema dell'app Comune di Marcianise
// Verifica che il tema verde scuro istituzionale sia configurato correttamente

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marcianise_app/core/theme/app_colors.dart';
import 'package:marcianise_app/core/theme/app_theme.dart';
import 'package:marcianise_app/core/theme/app_text_styles.dart';

void main() {
  group('AppColors - Colori istituzionali', () {
    test('Primary è verde scuro #008055', () {
      expect(AppColors.primary, const Color(0xFF008055));
    });

    test('PrimaryDark è verde più scuro #005C3E', () {
      expect(AppColors.primaryDark, const Color(0xFF005C3E));
    });

    test('PrimaryLight è verde chiaro #4CAF82', () {
      expect(AppColors.primaryLight, const Color(0xFF4CAF82));
    });

    test('ScaffoldBg è verde chiaro #EEF7F0', () {
      expect(AppColors.scaffoldBg, const Color(0xFFEEF7F0));
    });

    test('Colori card servizi sono 6', () {
      // Verifica che ci siano almeno 6 colori per le card servizi
      expect(AppColors.cardService1, isNotNull);
      expect(AppColors.cardService2, isNotNull);
      expect(AppColors.cardService3, isNotNull);
      expect(AppColors.cardService4, isNotNull);
      expect(AppColors.cardService5, isNotNull);
      expect(AppColors.cardService6, isNotNull);
    });
  });

  group('AppTheme - Configurazione tema', () {
    test('LightTheme usa Material Design 3', () {
      final theme = AppTheme.lightTheme;
      expect(theme.useMaterial3, isTrue);
    });

    test('AppBar ha sfondo verde primary', () {
      final theme = AppTheme.lightTheme;
      expect(theme.appBarTheme.backgroundColor, AppColors.primary);
    });

    test('Scaffold background è grigio chiaro', () {
      final theme = AppTheme.lightTheme;
      expect(theme.scaffoldBackgroundColor, AppColors.scaffoldBg);
    });

    test('ElevatedButton ha sfondo verde primary', () {
      final theme = AppTheme.lightTheme;
      final buttonStyle = theme.elevatedButtonTheme.style;
      expect(buttonStyle, isNotNull);
    });
  });

  group('AppTextStyles - Stili testo', () {
    test('Heading1 esiste e ha fontWeight bold', () {
      expect(AppTextStyles.heading1.fontWeight, FontWeight.bold);
    });

    test('BodyMedium esiste', () {
      expect(AppTextStyles.bodyMedium, isNotNull);
    });

    test('BodySmall esiste', () {
      expect(AppTextStyles.bodySmall, isNotNull);
    });

    test('AppBarTitle ha colore bianco', () {
      expect(AppTextStyles.appBarTitle.color, Colors.white);
    });

    test('SectionTitle esiste e ha fontWeight bold', () {
      expect(AppTextStyles.sectionTitle.fontWeight, FontWeight.bold);
    });
  });
}
