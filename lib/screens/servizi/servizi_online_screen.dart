import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../core/utils/localization_extension.dart';

/// Schermata servizi online del comune
/// Mostra i link ai servizi digitali disponibili
class ServiziOnlineScreen extends StatelessWidget {
  const ServiziOnlineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComuneAppBar(
        titolo: context.l10n.screenServiziOnlineTitle,
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(context),
            const SizedBox(height: 24),

            // Lista servizi online (link reali dal sito comune.marcianise.ce.it)
            _buildServizioOnlineCard(
              context,
              context.l10n.serviziOnlineAnprTitle,
              context.l10n.serviziOnlineAnprDesc,
              Icons.badge_rounded,
              AppColors.primary,
            ),
            _buildServizioOnlineCard(
              context,
              context.l10n.serviziOnlinePagopaTitle,
              context.l10n.serviziOnlinePagopaDesc,
              Icons.payment_rounded,
              const Color(0xFF43A047),
            ),
            _buildServizioOnlineCard(
              context,
              context.l10n.serviziOnlineImuTariTitle,
              context.l10n.serviziOnlineImuTariDesc,
              Icons.receipt_long_rounded,
              const Color(0xFFE65100),
            ),
            _buildServizioOnlineCard(
              context,
              context.l10n.serviziOnlineSuapTitle,
              context.l10n.serviziOnlineSuapDesc,
              Icons.store_rounded,
              const Color(0xFF6A1B9A),
            ),
            _buildServizioOnlineCard(
              context,
              context.l10n.serviziOnlineSueTitle,
              context.l10n.serviziOnlineSueDesc,
              Icons.apartment_rounded,
              const Color(0xFF00838F),
            ),
            _buildServizioOnlineCard(
              context,
              context.l10n.serviziOnlineAlboTitle,
              context.l10n.serviziOnlineAlboDesc,
              Icons.gavel_rounded,
              const Color(0xFF795548),
            ),
            _buildServizioOnlineCard(
              context,
              context.l10n.serviziOnlineTrasparenzaTitle,
              context.l10n.serviziOnlineTrasparenzaDesc,
              Icons.visibility_rounded,
              const Color(0xFF546E7A),
            ),
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
        color: AppColors.cardService5,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFF00838F).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.language_rounded,
              color: Color(0xFF00838F),
              size: 40,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            context.l10n.screenServiziOnlineTitle,
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.serviziOnlineHeaderSubtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Card singolo servizio online con feedback al tap
  Widget _buildServizioOnlineCard(
    BuildContext context,
    String titolo,
    String descrizione,
    IconData icona,
    Color colore,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardShadow,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colore.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icona, color: colore, size: 24),
        ),
        title: Text(titolo, style: AppTextStyles.heading3),
        subtitle: Text(
          descrizione,
          style: AppTextStyles.bodySmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Icon(
          Icons.open_in_new_rounded,
          size: 18,
          color: AppColors.textSecondary,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {
          // TODO: Aprire il servizio online con url_launcher
          SnackBarHelper.showInfo(
            context,
            context.l10n.messageOpenServiceComingSoon(titolo),
          );
        },
      ),
    );
  }
}
