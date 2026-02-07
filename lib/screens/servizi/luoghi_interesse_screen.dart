import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../data/mock_data.dart';
import '../../widgets/skeleton_poi_card.dart';
import 'widgets/poi_form_dialog.dart';
import '../../core/utils/localization_extension.dart';

/// Sezione 3 - Punti di Interesse (struttura richiesta)
/// 3.1. Crea nuovo POI (nome, descrizione, geolocalizzazione)
/// 3.2. Visualizza POI
/// 3.3. Modifica/elimina POI
class LuoghiInteresseScreen extends StatefulWidget {
  const LuoghiInteresseScreen({super.key});

  @override
  State<LuoghiInteresseScreen> createState() => _LuoghiInteresseScreenState();
}

class _LuoghiInteresseScreenState extends State<LuoghiInteresseScreen> {
  bool _isRefreshing = false;

  /// Gestisce il pull-to-refresh simulando un caricamento breve.
  Future<void> _handleRefresh() async {
    setState(() => _isRefreshing = true);
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() => _isRefreshing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComuneAppBar(
        titolo: context.l10n.screenLuoghiInteresseTitle,
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      // 3.1 - FAB per creare nuovo POI
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => PoiFormDialog.mostraFormCreaPOI(context),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_location_alt_rounded, color: AppColors.textOnPrimary),
        label: Text(
          context.l10n.actionCreaPoi,
          style: const TextStyle(color: AppColors.textOnPrimary),
        ),
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 24),

              // Lista luoghi di interesse reali di Marcianise (3.2 Visualizza POI)
              _buildPoiList(context),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPoiList(BuildContext context) {
    const poiList = MockData.poi;
    if (_isRefreshing) {
      return Column(
        children: List.generate(
          4,
          (_) => const SkeletonPoiCard(),
        ),
      );
    }

    return Column(
      children: poiList
          .map((poi) => _buildLuogoCard(
                context,
                poi.nome,
                poi.descrizione,
                poi.icona,
                poi.indirizzo,
              ))
          .toList(),
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
            context.l10n.poiHeaderTitle,
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.poiHeaderSubtitle,
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
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        boxShadow: AppColors.cardShadow,
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
                borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
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
              icon: Icon(Icons.more_vert_rounded, color: AppColors.textSecondary, size: 20),
              onSelected: (value) {
                if (value == 'modifica') {
                  SnackBarHelper.showInfo(
                    context,
                    context.l10n.messageBackOfficeEdit(nome),
                  );
                } else if (value == 'elimina') {
                  SnackBarHelper.showWarning(
                    context,
                    context.l10n.messageBackOfficeDelete(nome),
                  );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'modifica',
                  child: Row(
                    children: [
                      const Icon(Icons.edit_rounded, size: 20),
                      const SizedBox(width: 8),
                      Text(context.l10n.actionEdit),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'elimina',
                  child: Row(
                    children: [
                      const Icon(Icons.delete_rounded, size: 20, color: Colors.red),
                      const SizedBox(width: 8),
                      Text(
                        context.l10n.actionDelete,
                        style: const TextStyle(color: Colors.red),
                      ),
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
