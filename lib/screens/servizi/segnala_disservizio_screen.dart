import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../core/utils/localization_extension.dart';

/// Schermata per segnalare un disservizio al comune
/// L'utente potrà compilare un form con descrizione, categoria e foto
class SegnalaDisservizioScreen extends StatelessWidget {
  const SegnalaDisservizioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComuneAppBar(
        titolo: context.l10n.screenSegnalaDisservizioTitle,
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icona e titolo
            _buildHeader(context),
            const SizedBox(height: 24),

            // Form segnalazione
            _buildFormField(
              context.l10n.disservizioFieldCategoryLabel,
              context.l10n.disservizioFieldCategoryHint,
              Icons.category_rounded,
            ),
            const SizedBox(height: 16),
            _buildFormField(
              context.l10n.disservizioFieldTitleLabel,
              context.l10n.disservizioFieldTitleHint,
              Icons.title_rounded,
            ),
            const SizedBox(height: 16),
            _buildTextArea(
              context.l10n.disservizioFieldDescriptionLabel,
              context.l10n.disservizioFieldDescriptionHint,
            ),
            const SizedBox(height: 16),
            _buildFormField(
              context.l10n.disservizioFieldAddressLabel,
              context.l10n.disservizioFieldAddressHint,
              Icons.place_rounded,
            ),
            const SizedBox(height: 16),

            // Pulsante aggiungi foto
            _buildFotoButton(context),
            const SizedBox(height: 24),

            // Pulsante invio
            _buildInviaButton(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  /// Header con icona e descrizione
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.cardService1,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.warning_amber_rounded,
              color: AppColors.primary,
              size: 40,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            context.l10n.disservizioHeaderTitle,
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.disservizioHeaderSubtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Campo form generico
  Widget _buildFormField(String label, String hint, IconData icona) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.heading3),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary.withValues(alpha: 0.5),
            ),
            prefixIcon: Icon(icona, color: AppColors.primary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.textSecondary.withValues(alpha: 0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.textSecondary.withValues(alpha: 0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            filled: true,
            fillColor: AppColors.surface,
          ),
        ),
      ],
    );
  }

  /// Text area per descrizione lunga
  Widget _buildTextArea(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.heading3),
        const SizedBox(height: 8),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary.withValues(alpha: 0.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.textSecondary.withValues(alpha: 0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.textSecondary.withValues(alpha: 0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            filled: true,
            fillColor: AppColors.surface,
          ),
        ),
      ],
    );
  }

  /// Pulsante per aggiungere foto
  Widget _buildFotoButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primary.withValues(alpha: 0.05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.camera_alt_rounded, color: AppColors.primary, size: 32),
          const SizedBox(height: 8),
          Text(
            context.l10n.disservizioAddPhoto,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Pulsante invio segnalazione
  Widget _buildInviaButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Implementare invio segnalazione al back office
          SnackBarHelper.showSuccess(
            context,
            context.l10n.messageDisservizioSent,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          context.l10n.disservizioSubmit,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textOnPrimary,
          ),
        ),
      ),
    );
  }
}
