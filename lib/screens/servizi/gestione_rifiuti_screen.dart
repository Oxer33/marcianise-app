import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';

/// Schermata gestione rifiuti
/// Mostra il calendario raccolta differenziata e info utili
class GestioneRifiutiScreen extends StatelessWidget {
  const GestioneRifiutiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ComuneAppBar(
        titolo: 'Gestione Rifiuti',
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

            // Calendario settimanale
            const Text('Calendario Raccolta', style: AppTextStyles.sectionTitle),
            const SizedBox(height: 12),

            _buildGiornoRaccolta('Lunedì', 'Organico', Colors.brown, Icons.eco_rounded),
            _buildGiornoRaccolta('Martedì', 'Plastica e Metalli', Colors.orange, Icons.recycling_rounded),
            _buildGiornoRaccolta('Mercoledì', 'Indifferenziata', Colors.grey, Icons.delete_rounded),
            _buildGiornoRaccolta('Giovedì', 'Carta e Cartone', Colors.blue, Icons.description_rounded),
            _buildGiornoRaccolta('Venerdì', 'Vetro', Colors.green, Icons.wine_bar_rounded),
            _buildGiornoRaccolta('Sabato', 'Organico', Colors.brown, Icons.eco_rounded),

            const SizedBox(height: 24),

            // Info centro raccolta
            const Text('Centro Raccolta', style: AppTextStyles.sectionTitle),
            const SizedBox(height: 12),
            _buildInfoCentroRaccolta(),
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
          const Text(
            'Gestione dei rifiuti',
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Consulta il calendario della raccolta differenziata e le informazioni utili.',
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
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
  Widget _buildInfoCentroRaccolta() {
    return Container(
      width: double.infinity,
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on_rounded, color: AppColors.primary),
              SizedBox(width: 8),
              Text('Centro Raccolta Comunale', style: AppTextStyles.heading3),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Zona Industriale - Marcianise (CE)',
            style: AppTextStyles.bodyMedium,
          ),
          SizedBox(height: 4),
          Text(
            'Orari: Lun-Sab 8:00 - 13:00 | Mar-Gio 15:00 - 18:00',
            style: AppTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}
