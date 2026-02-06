import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';

/// Schermata contatti degli uffici comunali
/// Mostra numeri di telefono, email e orari di apertura
class ContattaUfficiScreen extends StatelessWidget {
  const ContattaUfficiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ComuneAppBar(
        titolo: 'Contatta gli Uffici',
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
            _buildHeader(),
            const SizedBox(height: 24),

            // === SEDE PRINCIPALE (dati reali) ===
            _buildSedeCard(),
            const SizedBox(height: 16),

            // Lista contatti uffici
            _buildContattoCard(
              'Centralino',
              AppConstants.telefono,
              AppConstants.email,
              'Lun-Ven: 8:30 - 14:00',
              Icons.phone_rounded,
            ),
            _buildContattoCard(
              'Ufficio Anagrafe',
              AppConstants.telefonoAnagrafe,
              AppConstants.emailAnagrafe,
              'Lun-Ven: 9:00 - 13:00',
              Icons.badge_rounded,
            ),
            _buildContattoCard(
              'Ufficio Tributi',
              AppConstants.telefonoTributi,
              AppConstants.emailTributi,
              'Lun-Ven: 9:00 - 12:00 | Mar-Gio: 15:00 - 17:00',
              Icons.receipt_long_rounded,
            ),
            _buildContattoCard(
              'Polizia Municipale',
              AppConstants.telefonoPoliziaMunicipale,
              AppConstants.emailPolizia,
              'Lun-Dom: 8:00 - 20:00',
              Icons.local_police_rounded,
            ),
            _buildContattoCard(
              'Ufficio Tecnico',
              AppConstants.telefonoUfficioTecnico,
              AppConstants.emailTecnico,
              'Lun-Ven: 9:00 - 13:00',
              Icons.engineering_rounded,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  /// Header con icona e descrizione
  Widget _buildHeader() {
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
          const Text(
            'Contatta gli uffici',
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Trova i contatti di tutti gli uffici comunali.',
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
  Widget _buildSedeCard() {
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
          const Row(
            children: [
              Icon(Icons.location_city_rounded, color: Colors.white, size: 28),
              SizedBox(width: 10),
              Text(
                'Sede Municipale',
                style: TextStyle(
                  color: Colors.white,
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
          _buildInfoRowWhite(Icons.mark_email_read_rounded, 'PEC: ${AppConstants.pec}'),
        ],
      ),
    );
  }

  /// Riga info bianca (per card con sfondo scuro)
  Widget _buildInfoRowWhite(IconData icona, String testo) {
    return Row(
      children: [
        Icon(icona, size: 16, color: Colors.white70),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            testo,
            style: const TextStyle(color: Colors.white, fontSize: 13),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
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
