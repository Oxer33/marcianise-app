import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/localization_extension.dart';

/// Schermata contatti degli uffici comunali
/// Mostra numeri di telefono, email e orari di apertura
class ContattaUfficiScreen extends StatelessWidget {
  const ContattaUfficiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComuneAppBar(
        titolo: context.l10n.screenContattaUfficiTitle,
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

            // === SEDE PRINCIPALE (dati reali) ===
            _buildSedeCard(context),
            const SizedBox(height: 16),

            // Lista contatti uffici
            _buildContattoCard(
              context.l10n.contactOfficeCentralino,
              AppConstants.telefono,
              AppConstants.email,
              context.l10n.contactOfficeCentralinoHours,
              Icons.phone_rounded,
            ),
            _buildContattoCard(
              context.l10n.contactOfficeAnagrafe,
              AppConstants.telefonoAnagrafe,
              AppConstants.emailAnagrafe,
              context.l10n.contactOfficeAnagrafeHours,
              Icons.badge_rounded,
            ),
            _buildContattoCard(
              context.l10n.contactOfficeTributi,
              AppConstants.telefonoTributi,
              AppConstants.emailTributi,
              context.l10n.contactOfficeTributiHours,
              Icons.receipt_long_rounded,
            ),
            _buildContattoCard(
              context.l10n.contactOfficePolizia,
              AppConstants.telefonoPoliziaMunicipale,
              AppConstants.emailPolizia,
              context.l10n.contactOfficePoliziaHours,
              Icons.local_police_rounded,
            ),
            _buildContattoCard(
              context.l10n.contactOfficeTecnico,
              AppConstants.telefonoUfficioTecnico,
              AppConstants.emailTecnico,
              context.l10n.contactOfficeTecnicoHours,
              Icons.engineering_rounded,
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
        color: AppColors.cardService3,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFFE65100).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.headset_mic_rounded,
              color: Color(0xFFE65100),
              size: 40,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            context.l10n.contactHeaderTitle,
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.contactHeaderSubtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Card sede principale del Comune con dati reali
  Widget _buildSedeCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppColors.headerGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_city_rounded, color: AppColors.textOnPrimary, size: 28),
              const SizedBox(width: 10),
              Text(
                context.l10n.contactMunicipioTitle,
                style: const TextStyle(
                  color: AppColors.textOnPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _buildInfoRowWhite(Icons.place_rounded, AppConstants.indirizzoCompleto),
          const SizedBox(height: 6),
          _buildInfoRowWhite(Icons.phone_rounded, AppConstants.telefono),
          const SizedBox(height: 6),
          _buildInfoRowWhite(Icons.email_rounded, AppConstants.email),
          const SizedBox(height: 6),
          _buildInfoRowWhite(
            Icons.mark_email_read_rounded,
            context.l10n.contactPecLabel(AppConstants.pec),
          ),
        ],
      ),
    );
  }

  /// Riga info bianca (per card con sfondo scuro)
  Widget _buildInfoRowWhite(IconData icona, String testo) {
    return Row(
      children: [
        Icon(icona, size: 16, color: AppColors.textOnPrimary.withValues(alpha: 0.7)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            testo,
            style: const TextStyle(color: AppColors.textOnPrimary, fontSize: 13),
          ),
        ),
      ],
    );
  }

  /// Card contatto singolo ufficio
  Widget _buildContattoCard(
    String nome,
    String telefono,
    String email,
    String orari,
    IconData icona,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nome ufficio
          Row(
            children: [
              Icon(icona, color: AppColors.primary, size: 24),
              const SizedBox(width: 8),
              Text(nome, style: AppTextStyles.heading3),
            ],
          ),
          const SizedBox(height: 12),
          // Telefono
          _buildInfoRow(Icons.phone_rounded, telefono),
          const SizedBox(height: 6),
          // Email
          _buildInfoRow(Icons.email_rounded, email),
          const SizedBox(height: 6),
          // Orari
          _buildInfoRow(Icons.access_time_rounded, orari),
        ],
      ),
    );
  }

  /// Riga con icona e testo info
  Widget _buildInfoRow(IconData icona, String testo) {
    return Row(
      children: [
        Icon(icona, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            testo,
            style: AppTextStyles.bodySmall,
          ),
        ),
      ],
    );
  }
}
