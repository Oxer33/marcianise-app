import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import 'widgets/poi_form_dialog.dart';

/// Sezione 3 - Punti di Interesse (struttura richiesta)
/// 3.1. Crea nuovo POI (nome, descrizione, geolocalizzazione)
/// 3.2. Visualizza POI
/// 3.3. Modifica/elimina POI
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
      // 3.1 - FAB per creare nuovo POI
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => PoiFormDialog.mostraFormCreaPOI(context),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_location_alt_rounded, color: Colors.white),
        label: const Text('Crea POI', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: 24),

            // Lista luoghi di interesse reali di Marcianise (3.2 Visualizza POI)
            _buildLuogoCard(
              context,
              'Duomo dell\'Annunziata',
              'La chiesa madre di Marcianise, risalente al XIII secolo con campanile medievale.',
              Icons.church_rounded,
              'Piazza Umberto I, Marcianise',
            ),
            _buildLuogoCard(
              context,
              'Palazzo Municipale',
              'Sede del Comune di Marcianise, edificio storico in Piazza Umberto I.',
              Icons.account_balance_rounded,
              'Via Roma, 18 - Marcianise',
            ),
            _buildLuogoCard(
              context,
              'Castello di Marcianise (Torrione)',
              'Antico castello medievale con torre cilindrica, simbolo della città.',
              Icons.castle_rounded,
              'Via Torrione, Marcianise',
            ),
            _buildLuogoCard(
              context,
              'Chiesa di San Francesco di Paola',
              'Chiesa settecentesca con pregevoli decorazioni barocche.',
              Icons.church_rounded,
              'Via San Francesco, Marcianise',
            ),
            _buildLuogoCard(
              context,
              'Villa Comunale',
              'Parco pubblico principale con giardini, viali alberati e area giochi.',
              Icons.park_rounded,
              'Via Roma, Marcianise',
            ),
            _buildLuogoCard(
              context,
              'Centro Commerciale Campania',
              'Uno dei centri commerciali più grandi del Sud Italia, a Marcianise.',
              Icons.shopping_bag_rounded,
              'SS 87 Sannitica, Marcianise',
            ),
            _buildLuogoCard(
              context,
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

  /// 3.2 - Card singolo POI con opzioni 3.3 modifica/elimina
  Widget _buildLuogoCard(
    BuildContext context,
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
            // 3.3 - Menu modifica/elimina POI
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert_rounded, color: AppColors.textSecondary, size: 20),
              onSelected: (value) {
                if (value == 'modifica') {
                  SnackBarHelper.showInfo(context, 'Modifica "$nome" - collegare al back office');
                } else if (value == 'elimina') {
                  SnackBarHelper.showWarning(context, 'Eliminazione "$nome" - collegare al back office');
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'modifica',
                  child: Row(
                    children: [
                      Icon(Icons.edit_rounded, size: 20),
                      SizedBox(width: 8),
                      Text('Modifica'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'elimina',
                  child: Row(
                    children: [
                      Icon(Icons.delete_rounded, size: 20, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Elimina', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Form crea POI (3.1) estratto in widgets/poi_form_dialog.dart
}
