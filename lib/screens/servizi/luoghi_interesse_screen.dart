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

            // Lista luoghi di interesse reali di Marcianise
            _buildLuogoCard(
              'Duomo dell\'Annunziata',
              'La chiesa madre di Marcianise, risalente al XIII secolo con campanile medievale.',
              Icons.church_rounded,
              'Piazza Umberto I, Marcianise',
            ),
            _buildLuogoCard(
              'Palazzo Municipale',
              'Sede del Comune di Marcianise, edificio storico in Piazza Umberto I.',
              Icons.account_balance_rounded,
              'Via Roma, 18 - Marcianise',
            ),
            _buildLuogoCard(
              'Castello di Marcianise (Torrione)',
              'Antico castello medievale con torre cilindrica, simbolo della città.',
              Icons.castle_rounded,
              'Via Torrione, Marcianise',
            ),
            _buildLuogoCard(
              'Chiesa di San Francesco di Paola',
              'Chiesa settecentesca con pregevoli decorazioni barocche.',
              Icons.church_rounded,
              'Via San Francesco, Marcianise',
            ),
            _buildLuogoCard(
              'Villa Comunale',
              'Parco pubblico principale con giardini, viali alberati e area giochi.',
              Icons.park_rounded,
              'Via Roma, Marcianise',
            ),
            _buildLuogoCard(
              'Centro Commerciale Campania',
              'Uno dei centri commerciali più grandi del Sud Italia, a Marcianise.',
              Icons.shopping_bag_rounded,
              'SS 87 Sannitica, Marcianise',
            ),
            _buildLuogoCard(
              'Reggia di Caserta (a 5 km)',
              'Patrimonio UNESCO, la Reggia borbonica più grande d\'Europa.',
              Icons.museum_rounded,
              'Viale Douhet, Caserta (5 km)',
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
          const Text(
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
