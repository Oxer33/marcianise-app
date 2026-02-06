import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';

/// Modulo D - Cultura e Turismo
/// Panoramica del patrimonio culturale e turistico di Marcianise
/// Include: monumenti, chiese, biblioteca, parcheggi, impianti sportivi
class CulturaTurismoScreen extends StatelessWidget {
  const CulturaTurismoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ComuneAppBar(
        titolo: 'Cultura e Turismo',
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === HEADER SEZIONE ===
            const Text('Scopri Marcianise', style: AppTextStyles.heading1),
            const SizedBox(height: 8),
            Text(
              'Il patrimonio culturale, i luoghi da visitare e le strutture del territorio.',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),

            // === CATEGORIE CULTURALI ===
            _buildCategoriaCard(
              context,
              icona: Icons.church_rounded,
              titolo: 'Chiese e Siti Religiosi',
              descrizione: 'Duomo di San Michele Arcangelo, Chiesa dell\'Annunziata, Chiesa di San Carlo Borromeo e altri luoghi di culto.',
              colore: AppColors.cardService1,
            ),
            _buildCategoriaCard(
              context,
              icona: Icons.account_balance_rounded,
              titolo: 'Monumenti e Piazze',
              descrizione: 'Palazzo Municipale, Piazza Umberto I, Fontana monumentale, Monumento ai Caduti.',
              colore: AppColors.cardService2,
            ),
            _buildCategoriaCard(
              context,
              icona: Icons.menu_book_rounded,
              titolo: 'Biblioteca Comunale',
              descrizione: 'Servizi di prestito, consultazione, sala studio e attività culturali. Orari: Lun-Ven 9:00 - 13:00 / 15:00 - 18:00.',
              colore: AppColors.cardService3,
            ),
            _buildCategoriaCard(
              context,
              icona: Icons.local_parking_rounded,
              titolo: 'Parcheggi Pubblici',
              descrizione: 'Informazioni su disponibilità, gratuità e regolamentazioni dei parcheggi comunali.',
              colore: AppColors.cardService4,
            ),
            _buildCategoriaCard(
              context,
              icona: Icons.sports_soccer_rounded,
              titolo: 'Impianti Sportivi',
              descrizione: 'Stadio Comunale, Palazzetto dello Sport, campi da tennis, piscina comunale e altre strutture.',
              colore: AppColors.cardService5,
            ),
            _buildCategoriaCard(
              context,
              icona: Icons.park_rounded,
              titolo: 'Parchi e Aree Verdi',
              descrizione: 'Parco Comunale, Villa Comunale, aree gioco e percorsi verdi per famiglie.',
              colore: AppColors.cardService6,
            ),

            const SizedBox(height: 16),

            // === NOTA INFORMATIVA ===
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardService1.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Contenuti gestiti dal back office comunale. Le informazioni verranno aggiornate dagli operatori.',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Card per ogni categoria culturale/turistica
  Widget _buildCategoriaCard(
    BuildContext context, {
    required IconData icona,
    required String titolo,
    required String descrizione,
    required Color colore,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icona colorata
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: colore,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icona, color: AppColors.primary, size: 28),
          ),
          const SizedBox(width: 14),
          // Testo
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titolo, style: AppTextStyles.heading3),
                const SizedBox(height: 4),
                Text(
                  descrizione,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          // Freccia navigazione
          Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
