import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../core/utils/localization_extension.dart';

/// Modulo B - Diretta live Consiglio Comunale
/// Mostra i video delle sedute del consiglio comunale
/// Canale YouTube: https://www.youtube.com/channel/UCglEv_b7yTzb1hVB2HxYeGQ/videos
class ConsiglioScreen extends StatelessWidget {
  const ConsiglioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComuneAppBar(
        titolo: context.l10n.screenConsiglioTitle,
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === FILTRO DATA ===
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.l10n.consiglioRecentVideosTitle, style: AppTextStyles.sectionTitle),
                  TextButton.icon(
                    onPressed: () {
                      // TODO: Implementare filtro data
                      SnackBarHelper.showInfo(
                        context,
                        context.l10n.messageFilterByDateComingSoon,
                      );
                    },
                    icon: const Icon(Icons.filter_alt_outlined, size: 18),
                    label: Text(context.l10n.actionFilterByDate),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // === VIDEO IN EVIDENZA ===
              _buildVideoEvidenza(context),
              const SizedBox(height: 24),

              // === TITOLO SEDUTE PRECEDENTI ===
              Text(context.l10n.consiglioPreviousSessionsTitle, style: AppTextStyles.sectionTitle),
              const SizedBox(height: 12),

              // === LISTA SEDUTE ===
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _buildSedutaCard(context, index);
                  },
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  /// Video principale in evidenza
  Widget _buildVideoEvidenza(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail video
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryDark.withValues(alpha: 0.2),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppConstants.borderRadiusMedium),
              ),
            ),
            child: Center(
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: AppColors.textOnPrimary,
                  size: 40,
                ),
              ),
            ),
          ),
          // Info video
          Padding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.consiglioHighlightTitle,
                  style: AppTextStyles.heading3,
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.consiglioHighlightSubtitle,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Card singola seduta precedente
  Widget _buildSedutaCard(BuildContext context, int index) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppConstants.borderRadiusMedium),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.play_circle_outline_rounded,
                color: AppColors.primary,
                size: 36,
              ),
            ),
          ),
          // Info
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              context.l10n.consiglioSessionTitle(2026 + index),
              style: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
