import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';

/// Schermata luoghi di interesse di Marcianise
/// Mostra monumenti, chiese, parchi e punti di interesse
class LuoghiInteresseScreen extends StatelessWidget {
  const LuoghiInteresseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ComuneAppBar(
        titolo: 'Luoghi di Interesse',
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

            // Lista luoghi
            _buildLuogoCard(
              'Cattedrale di San Michele Arcangelo',
              'La cattedrale principale della città, risalente al XII secolo.',
              Icons.church_rounded,
              'Via Duomo, Marcianise',
            ),
            _buildLuogoCard(
              'Palazzo Municipale',
              'Il palazzo storico sede del comune, costruito nel XVIII secolo.',
              Icons.account_balance_rounded,
              'Piazza Umberto I, Marcianise',
            ),
            _buildLuogoCard(
              'Villa Comunale',
              'Il parco pubblico principale della città, ideale per passeggiate.',
              Icons.park_rounded,
              'Via Roma, Marcianise',
            ),
            _buildLuogoCard(
              'Chiesa dell\'Annunziata',
              'Chiesa storica con affreschi del XVI secolo.',
              Icons.church_rounded,
              'Via Annunziata, Marcianise',
            ),
            _buildLuogoCard(
              'Centro Commerciale Campania',
              'Uno dei centri commerciali più grandi del Sud Italia.',
              Icons.shopping_bag_rounded,
              'SS 87, Marcianise',
            ),
            _buildLuogoCard(
              'Parco Reale di Caserta (nelle vicinanze)',
              'La famosa Reggia di Caserta, patrimonio UNESCO, a pochi km.',
              Icons.castle_rounded,
              'Viale Douhet, Caserta',
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
        color: AppColors.cardService6,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFF6A1B9A).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.place_rounded,
              color: Color(0xFF6A1B9A),
              size: 40,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Luoghi di interesse',
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Scopri i monumenti, le chiese e i luoghi più belli di Marcianise e dintorni.',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Card singolo luogo di interesse
  Widget _buildLuogoCard(
    String nome,
    String descrizione,
    IconData icona,
    String indirizzo,
  ) {
    return Container(
      width: double.infinity,
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
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icona
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.cardService6,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icona, color: const Color(0xFF6A1B9A), size: 28),
            ),
            const SizedBox(width: 12),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nome, style: AppTextStyles.heading3),
                  const SizedBox(height: 4),
                  Text(
                    descrizione,
                    style: AppTextStyles.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.place_rounded,
                        size: 14,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          indirizzo,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.primary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
