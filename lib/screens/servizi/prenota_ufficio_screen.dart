import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../core/utils/localization_extension.dart';

/// Schermata per prenotare un appuntamento in un ufficio comunale
/// L'utente potrà selezionare l'ufficio, la data e l'ora
class PrenotaUfficioScreen extends StatelessWidget {
  const PrenotaUfficioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComuneAppBar(
        titolo: context.l10n.screenPrenotaUfficioTitle,
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header con icona
            _buildHeader(context),
            const SizedBox(height: 24),

            // Lista uffici disponibili (Aree/Settori reali dal sito)
            Text(context.l10n.prenotaSelectOfficeTitle, style: AppTextStyles.heading3),
            const SizedBox(height: 12),
            _buildUfficioCard(
              context,
              context.l10n.prenotaOfficeAnagrafeTitle,
              Icons.badge_rounded,
              context.l10n.prenotaOfficeAnagrafeLocation,
              context.l10n.prenotaOfficeAnagrafeHours,
            ),
            _buildUfficioCard(
              context,
              context.l10n.prenotaOfficeTributiTitle,
              Icons.receipt_long_rounded,
              context.l10n.prenotaOfficeTributiLocation,
              context.l10n.prenotaOfficeTributiHours,
            ),
            _buildUfficioCard(
              context,
              context.l10n.prenotaOfficeTecnicoTitle,
              Icons.engineering_rounded,
              context.l10n.prenotaOfficeTecnicoLocation,
              context.l10n.prenotaOfficeTecnicoHours,
            ),
            _buildUfficioCard(
              context,
              context.l10n.prenotaOfficeUrpTitle,
              Icons.headset_mic_rounded,
              context.l10n.prenotaOfficeUrpLocation,
              context.l10n.prenotaOfficeUrpHours,
            ),
            _buildUfficioCard(
              context,
              context.l10n.prenotaOfficePoliziaTitle,
              Icons.local_police_rounded,
              context.l10n.prenotaOfficePoliziaLocation,
              context.l10n.prenotaOfficePoliziaHours,
            ),
            _buildUfficioCard(
              context,
              context.l10n.prenotaOfficeServiziSocialiTitle,
              Icons.family_restroom_rounded,
              context.l10n.prenotaOfficeServiziSocialiLocation,
              context.l10n.prenotaOfficeServiziSocialiHours,
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
        color: AppColors.cardService2,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFF43A047).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.business_rounded,
              color: Color(0xFF43A047),
              size: 40,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            context.l10n.prenotaHeaderTitle,
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.prenotaHeaderSubtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Card singolo ufficio con orari apertura e feedback prenotazione
  Widget _buildUfficioCard(BuildContext context, String nome, IconData icona, String posizione, String orari) {
    return Container(
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
            color: AppColors.cardService2,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icona, color: const Color(0xFF43A047), size: 24),
        ),
        title: Text(nome, style: AppTextStyles.heading3),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(posizione, style: AppTextStyles.bodySmall),
            const SizedBox(height: 2),
            Text(
              orari,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.primary,
                fontSize: 11,
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: AppColors.textSecondary,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {
          // TODO: Navigare alla prenotazione specifica con date picker
          SnackBarHelper.showInfo(
            context,
            context.l10n.messageBookingComingSoon(nome),
          );
        },
      ),
    );
  }
}
