import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/localization_extension.dart';

/// Schermata gestione rifiuti
/// Mostra il calendario raccolta differenziata e info utili
class GestioneRifiutiScreen extends StatelessWidget {
  const GestioneRifiutiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComuneAppBar(
        titolo: context.l10n.screenGestioneRifiutiTitle,
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

            // Calendario settimanale
            Text(context.l10n.rifiutiScheduleTitle, style: AppTextStyles.sectionTitle),
            const SizedBox(height: 12),

            _buildGiornoRaccolta(context.l10n.rifiutiDayMonday, context.l10n.rifiutiTypeOrganico, Colors.brown, Icons.eco_rounded),
            _buildGiornoRaccolta(
              context.l10n.rifiutiDayTuesday,
              context.l10n.rifiutiTypePlasticaMetalli,
              Colors.orange,
              Icons.recycling_rounded,
            ),
            _buildGiornoRaccolta(
              context.l10n.rifiutiDayWednesday,
              context.l10n.rifiutiTypeIndifferenziata,
              Colors.grey,
              Icons.delete_rounded,
            ),
            _buildGiornoRaccolta(
              context.l10n.rifiutiDayThursday,
              context.l10n.rifiutiTypeCartaCartone,
              Colors.blue,
              Icons.description_rounded,
            ),
            _buildGiornoRaccolta(
              context.l10n.rifiutiDayFriday,
              context.l10n.rifiutiTypeVetro,
              Colors.green,
              Icons.wine_bar_rounded,
            ),
            _buildGiornoRaccolta(context.l10n.rifiutiDaySaturday, context.l10n.rifiutiTypeOrganico, Colors.brown, Icons.eco_rounded),

            const SizedBox(height: 24),

            // Info centro raccolta
            Text(context.l10n.rifiutiCenterTitle, style: AppTextStyles.sectionTitle),
            const SizedBox(height: 12),
            _buildInfoCentroRaccolta(context),
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
        color: AppColors.cardService4,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFFC62828).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.delete_outline_rounded,
              color: Color(0xFFC62828),
              size: 40,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            context.l10n.rifiutiHeaderTitle,
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.rifiutiHeaderSubtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Singolo giorno raccolta
  Widget _buildGiornoRaccolta(String giorno, String tipo, Color colore, IconData icona) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          // Indicatore colore
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colore.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icona, color: colore, size: 22),
          ),
          const SizedBox(width: 12),
          // Giorno
          SizedBox(
            width: 90,
            child: Text(
              giorno,
              style: AppTextStyles.heading3,
            ),
          ),
          // Tipo rifiuto
          Expanded(
            child: Text(
              tipo,
              style: AppTextStyles.bodyMedium.copyWith(
                color: colore,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Info centro raccolta comunale
  Widget _buildInfoCentroRaccolta(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_rounded, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(context.l10n.rifiutiCenterName, style: AppTextStyles.heading3),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            context.l10n.rifiutiCenterAddress,
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            context.l10n.rifiutiCenterHours,
            style: AppTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}
