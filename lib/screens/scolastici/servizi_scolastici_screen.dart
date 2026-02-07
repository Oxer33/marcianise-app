import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../widgets/comune_app_bar.dart';
import 'widgets/scolastico_form_dialog.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/utils/localization_extension.dart';

/// Sezione 5 - Servizi Scolastici
/// Struttura richiesta:
/// 5.1. Aggiungi servizi
/// 5.2. Modifica/elimina servizi
class ServiziScolasticiScreen extends StatelessWidget {
  const ServiziScolasticiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComuneAppBar(
        titolo: context.l10n.screenServiziScolasticiTitle,
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      // FAB per aggiungere nuovo servizio (5.1)
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ScolasticoFormDialog.mostraFormNuovoServizio(context),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_rounded, color: AppColors.textOnPrimary),
        label: Text(
          context.l10n.actionAggiungiServizio,
          style: const TextStyle(color: AppColors.textOnPrimary),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === HEADER ===
            _buildHeader(context),
            const SizedBox(height: 24),

            // === INFO BACK OFFICE ===
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardService4.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.info.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline_rounded, color: AppColors.info, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      context.l10n.scolasticiBackOfficeInfo,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // === LISTA SERVIZI SCOLASTICI ===
            Text(context.l10n.scolasticiActiveServicesTitle, style: AppTextStyles.heading2),
            const SizedBox(height: 12),
            _buildServizioCard(
              context,
              titolo: context.l10n.scolasticiServiceMensaTitle,
              descrizione: context.l10n.scolasticiServiceMensaDesc,
              icona: Icons.restaurant_rounded,
              stato: context.l10n.statusActive,
              colore: AppColors.success,
            ),
            _buildServizioCard(
              context,
              titolo: context.l10n.scolasticiServiceTrasportoTitle,
              descrizione: context.l10n.scolasticiServiceTrasportoDesc,
              icona: Icons.directions_bus_rounded,
              stato: context.l10n.statusActive,
              colore: AppColors.success,
            ),
            _buildServizioCard(
              context,
              titolo: context.l10n.scolasticiServicePrePostTitle,
              descrizione: context.l10n.scolasticiServicePrePostDesc,
              icona: Icons.access_time_rounded,
              stato: context.l10n.statusActive,
              colore: AppColors.success,
            ),
            _buildServizioCard(
              context,
              titolo: context.l10n.scolasticiServiceAssistenzaTitle,
              descrizione: context.l10n.scolasticiServiceAssistenzaDesc,
              icona: Icons.accessibility_new_rounded,
              stato: context.l10n.statusActive,
              colore: AppColors.success,
            ),
            _buildServizioCard(
              context,
              titolo: context.l10n.scolasticiServiceCedoleTitle,
              descrizione: context.l10n.scolasticiServiceCedoleDesc,
              icona: Icons.menu_book_rounded,
              stato: context.l10n.statusSeasonal,
              colore: AppColors.warning,
            ),
            _buildServizioCard(
              context,
              titolo: context.l10n.scolasticiServiceCentriTitle,
              descrizione: context.l10n.scolasticiServiceCentriDesc,
              icona: Icons.wb_sunny_rounded,
              stato: context.l10n.statusSeasonal,
              colore: AppColors.warning,
            ),
            // Spazio per il FAB
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Header con icona e descrizione
  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        // Icona scuola
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFF5C6BC0).withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.school_rounded,
            color: Color(0xFF5C6BC0),
            size: 40,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          context.l10n.screenServiziScolasticiTitle,
          style: AppTextStyles.heading2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          context.l10n.scolasticiHeaderSubtitle,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Card per un servizio scolastico con opzione modifica/elimina (5.2)
  Widget _buildServizioCard(
    BuildContext context, {
    required String titolo,
    required String descrizione,
    required IconData icona,
    required String stato,
    required Color colore,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          // Icona servizio
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colore.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icona, color: colore, size: 24),
          ),
          const SizedBox(width: 12),
          // Info servizio
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(titolo, style: AppTextStyles.heading3)),
                    // Badge stato
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: colore.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        stato,
                        style: TextStyle(
                          color: colore,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  descrizione,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Menu modifica/elimina (5.2)
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert_rounded, color: AppColors.textSecondary),
            onSelected: (value) {
              if (value == 'modifica') {
                SnackBarHelper.showInfo(
                  context,
                  context.l10n.messageBackOfficeEdit(titolo),
                );
              } else if (value == 'elimina') {
                SnackBarHelper.showWarning(
                  context,
                  context.l10n.messageBackOfficeDelete(titolo),
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
    );
  }

  // Form aggiungi servizio (5.1) estratto in widgets/scolastico_form_dialog.dart
}
