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

            // Lista contatti uffici
            _buildContattoCard(
              'Centralino',
              '0823 635111',
              'info@comune.marcianise.ce.it',
              'Lun-Ven: 8:30 - 14:00',
              Icons.phone_rounded,
            ),
            _buildContattoCard(
              'Ufficio Anagrafe',
              '0823 635200',
              'anagrafe@comune.marcianise.ce.it',
              'Lun-Ven: 9:00 - 13:00',
              Icons.badge_rounded,
            ),
            _buildContattoCard(
              'Ufficio Tributi',
              '0823 635300',
              'tributi@comune.marcianise.ce.it',
              'Lun-Ven: 9:00 - 12:00 | Mar-Gio: 15:00 - 17:00',
              Icons.receipt_long_rounded,
            ),
            _buildContattoCard(
              'Polizia Municipale',
              '0823 635400',
              'poliziamunicipale@comune.marcianise.ce.it',
              'Lun-Dom: 8:00 - 20:00',
              Icons.local_police_rounded,
            ),
            _buildContattoCard(
              'Ufficio Tecnico',
              '0823 635500',
              'tecnico@comune.marcianise.ce.it',
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
          Text(
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
