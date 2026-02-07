import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../widgets/evento_card.dart';
import '../../widgets/skeleton_evento_card.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../data/mock_data.dart';
import '../../models/evento_model.dart';
import 'widgets/evento_form_dialog.dart';
import '../../core/utils/localization_extension.dart';

/// Sezione 2 - Eventi (struttura richiesta)
/// 2.1. Visualizza Eventi
/// 2.2. Crea nuovo evento (titolo, contenuto, geolocalizzazione)
/// 2.3. Modifica/Elimina evento
class EventiScreen extends StatefulWidget {
  const EventiScreen({super.key});

  @override
  State<EventiScreen> createState() => _EventiScreenState();
}

class _EventiScreenState extends State<EventiScreen> {
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
    // Separa eventi futuri e passati
    final eventiFuturi =
        MockData.eventi.where((e) => !e.isPassato).toList();
    final eventiPassati =
        MockData.eventi.where((e) => e.isPassato).toList();

    return Scaffold(
      appBar: ComuneAppBar(
        titolo: context.l10n.screenEventiTitle,
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      // 2.2 - FAB per creare nuovo evento
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => EventoFormDialog.mostraFormCreaEvento(context),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_rounded, color: AppColors.textOnPrimary),
        label: Text(
          context.l10n.actionCreaEvento,
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
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // === FILTRO DATA ===
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.l10n.eventiToday, style: AppTextStyles.sectionTitle),
                    TextButton.icon(
                      onPressed: () {
                        // TODO: Implementare filtro data
                        SnackBarHelper.showInfo(context, context.l10n.eventiFilterComingSoon);
                      },
                      icon: const Icon(Icons.filter_alt_outlined, size: 18),
                      label: Text(context.l10n.actionFilterByDate),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // === EVENTI FUTURI ===
                _buildEventiFuturi(eventiFuturi),

                const SizedBox(height: 24),

                // === EVENTI PASSATI ===
                _buildEventiPassati(eventiPassati),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventiFuturi(List<EventoModel> eventiFuturi) {
    if (_isRefreshing) {
      return Column(
        children: List.generate(
          3,
          (_) => const SkeletonEventoCard(),
        ),
      );
    }

    if (eventiFuturi.isEmpty) {
      return _buildEmptyState(context.l10n.eventiEmpty);
    }

    return Column(
      children: eventiFuturi.map((e) => EventoCard(evento: e)).toList(),
    );
  }

  Widget _buildEventiPassati(List<EventoModel> eventiPassati) {
    if (!_isRefreshing && eventiPassati.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        // Titolo sezione con sfondo
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: AppColors.cardService1,
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          ),
          child: Text(
            context.l10n.eventiPastTitle,
            style: AppTextStyles.sectionTitle,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),

        // Lista eventi passati in scroll orizzontale
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: _isRefreshing ? 3 : eventiPassati.length,
            itemBuilder: (context, index) {
              if (_isRefreshing) {
                return const SkeletonEventoCard(isCompact: true);
              }
              return EventoCard(
                evento: eventiPassati[index],
                isCompact: true,
              );
            },
          ),
        ),
      ],
    );
  }

  /// Stato vuoto quando non ci sono eventi
  Widget _buildEmptyState(String messaggio) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(
              Icons.event_busy_rounded,
              size: 64,
              color: AppColors.textSecondary.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              messaggio,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Form crea evento (2.2) estratto in widgets/evento_form_dialog.dart
}
