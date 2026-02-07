import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/utils/localization_extension.dart';

/// Modulo D - Cultura e Turismo
/// Panoramica del patrimonio culturale e turistico di Marcianise
/// Include: monumenti, chiese, biblioteca, parcheggi, impianti sportivi
class CulturaTurismoScreen extends StatelessWidget {
  const CulturaTurismoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComuneAppBar(
        titolo: context.l10n.screenCulturaTurismoTitle,
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === HEADER SEZIONE ===
            Text(context.l10n.culturaHeaderTitle, style: AppTextStyles.heading1),
            const SizedBox(height: 8),
            Text(
              context.l10n.culturaHeaderSubtitle,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),

            // === CATEGORIE CULTURALI ===
            _buildCategoriaCard(
              context,
              icona: Icons.church_rounded,
              titolo: context.l10n.culturaCategoryChieseTitle,
              descrizione: context.l10n.culturaCategoryChieseDesc,
              colore: AppColors.cardService1,
            ),
            _buildCategoriaCard(
              context,
              icona: Icons.account_balance_rounded,
              titolo: context.l10n.culturaCategoryMonumentiTitle,
              descrizione: context.l10n.culturaCategoryMonumentiDesc,
              colore: AppColors.cardService2,
            ),
            _buildCategoriaCard(
              context,
              icona: Icons.menu_book_rounded,
              titolo: context.l10n.culturaCategoryBibliotecaTitle,
              descrizione: context.l10n.culturaCategoryBibliotecaDesc,
              colore: AppColors.cardService3,
            ),
            _buildCategoriaCard(
              context,
              icona: Icons.local_parking_rounded,
              titolo: context.l10n.culturaCategoryParcheggiTitle,
              descrizione: context.l10n.culturaCategoryParcheggiDesc,
              colore: AppColors.cardService4,
            ),
            _buildCategoriaCard(
              context,
              icona: Icons.sports_soccer_rounded,
              titolo: context.l10n.culturaCategorySportTitle,
              descrizione: context.l10n.culturaCategorySportDesc,
              colore: AppColors.cardService5,
            ),
            _buildCategoriaCard(
              context,
              icona: Icons.park_rounded,
              titolo: context.l10n.culturaCategoryParchiTitle,
              descrizione: context.l10n.culturaCategoryParchiDesc,
              colore: AppColors.cardService6,
            ),

            const SizedBox(height: 16),

            // === NOTA INFORMATIVA ===
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardService1.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      context.l10n.culturaBackOfficeNote,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Card per ogni categoria culturale/turistica
  Widget _buildCategoriaCard(
    BuildContext context, {
    required IconData icona,
    required String titolo,
    required String descrizione,
    required Color colore,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icona colorata
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: colore,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icona, color: AppColors.primary, size: 28),
          ),
          const SizedBox(width: 14),
          // Testo
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titolo, style: AppTextStyles.heading3),
                const SizedBox(height: 4),
                Text(
                  descrizione,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          // Freccia navigazione
          Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
