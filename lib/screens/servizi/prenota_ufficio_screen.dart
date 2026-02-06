import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';

/// Schermata per prenotare un appuntamento in un ufficio comunale
/// L'utente potrà selezionare l'ufficio, la data e l'ora
class PrenotaUfficioScreen extends StatelessWidget {
  const PrenotaUfficioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ComuneAppBar(
        titolo: 'Prenota Ufficio',
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
            _buildHeader(),
            const SizedBox(height: 24),

            // Lista uffici disponibili (Aree/Settori reali dal sito)
            const Text('Seleziona Ufficio', style: AppTextStyles.heading3),
            const SizedBox(height: 12),
            _buildUfficioCard(context, 'Anagrafe e Stato Civile', Icons.badge_rounded, 'Via Roma, 18 - Piano Terra', 'Lun-Ven: 9:00-13:00'),
            _buildUfficioCard(context, 'Ufficio Tributi (IMU/TARI)', Icons.receipt_long_rounded, 'Via Roma, 18 - Piano 1', 'Lun-Ven: 9:00-12:00 | Mar-Gio: 15:00-17:00'),
            _buildUfficioCard(context, 'Ufficio Tecnico - Edilizia', Icons.engineering_rounded, 'Via Roma, 18 - Piano 2', 'Lun-Ven: 9:00-13:00'),
            _buildUfficioCard(context, 'URP - Relazioni con il Pubblico', Icons.headset_mic_rounded, 'Via Roma, 18 - Piano Terra', 'Lun-Ven: 8:30-14:00'),
            _buildUfficioCard(context, 'Polizia Municipale', Icons.local_police_rounded, 'Via Roma, 18 - Edificio B', 'Lun-Dom: 8:00-20:00'),
            _buildUfficioCard(context, 'Servizi Sociali', Icons.family_restroom_rounded, 'Via Roma, 18 - Piano 1', 'Lun-Ven: 9:00-13:00'),
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
          const Text(
            'Prenota un appuntamento',
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Seleziona l\'ufficio e prenota comodamente il tuo appuntamento.',
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
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: AppColors.textSecondary,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {
          // TODO: Navigare alla prenotazione specifica con date picker
          SnackBarHelper.showInfo(context, 'Prenotazione per "$nome" - funzionalità in arrivo!');
        },
      ),
    );
  }
}
