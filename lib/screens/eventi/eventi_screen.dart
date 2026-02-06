import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../widgets/evento_card.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../data/mock_data.dart';
import 'widgets/evento_form_dialog.dart';

/// Sezione 2 - Eventi (struttura richiesta)
/// 2.1. Visualizza Eventi
/// 2.2. Crea nuovo evento (titolo, contenuto, geolocalizzazione)
/// 2.3. Modifica/Elimina evento
class EventiScreen extends StatelessWidget {
  const EventiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Separa eventi futuri e passati
    final eventiFuturi =
        MockData.eventi.where((e) => !e.isPassato).toList();
    final eventiPassati =
        MockData.eventi.where((e) => e.isPassato).toList();

    return Scaffold(
      appBar: const ComuneAppBar(
        titolo: 'Eventi',
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      // 2.2 - FAB per creare nuovo evento
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => EventoFormDialog.mostraFormCreaEvento(context),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: const Text('Crea Evento', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === FILTRO DATA ===
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Oggi', style: AppTextStyles.sectionTitle),
                  TextButton.icon(
                    onPressed: () {
                      // TODO: Implementare filtro data
                      SnackBarHelper.showInfo(context, 'Filtro per data - funzionalità in arrivo!');
                    },
                    icon: const Icon(Icons.filter_alt_outlined, size: 18),
                    label: const Text('Filtra per data'),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // === EVENTI FUTURI ===
              if (eventiFuturi.isNotEmpty)
                ...eventiFuturi.map((e) => EventoCard(evento: e)),

              if (eventiFuturi.isEmpty)
                _buildEmptyState('Nessun evento in programma'),

              const SizedBox(height: 24),

              // === EVENTI PASSATI ===
              if (eventiPassati.isNotEmpty) ...[
                // Titolo sezione con sfondo
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.cardService1,
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadiusMedium),
                  ),
                  child: const Text(
                    'Eventi Passati',
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
                    itemCount: eventiPassati.length,
                    itemBuilder: (context, index) {
                      return EventoCard(
                        evento: eventiPassati[index],
                        isCompact: true,
                      );
                    },
                  ),
                ),
              ],

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
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
