import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../widgets/evento_card.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../data/mock_data.dart';

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
        onPressed: () => _mostraFormCreaEvento(context),
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

  /// 2.2 - Form per creare nuovo evento
  /// 2.2.1. Titolo | 2.2.2. Contenuto | 2.2.3. Geolocalizzazione
  void _mostraFormCreaEvento(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          AppConstants.paddingMedium,
          AppConstants.paddingMedium,
          AppConstants.paddingMedium,
          MediaQuery.of(ctx).viewInsets.bottom + AppConstants.paddingMedium,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Crea Nuovo Evento', style: AppTextStyles.heading2),
              const SizedBox(height: 16),
              // 2.2.1 - Titolo
              const TextField(
                decoration: InputDecoration(
                  labelText: '2.2.1 Titolo dell\'evento',
                  prefixIcon: Icon(Icons.title_rounded),
                ),
              ),
              const SizedBox(height: 12),
              // 2.2.2 - Contenuto
              const TextField(
                decoration: InputDecoration(
                  labelText: '2.2.2 Contenuto / Descrizione',
                  prefixIcon: Icon(Icons.edit_note_rounded),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              // Data evento
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Data evento',
                  prefixIcon: Icon(Icons.calendar_today_rounded),
                  hintText: 'GG/MM/AAAA',
                ),
              ),
              const SizedBox(height: 12),
              // 2.2.3 - Geolocalizzazione
              const Text('2.2.3 Geolocalizzazione', style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  SnackBarHelper.showInfo(context, 'Seleziona posizione sulla mappa (collegare GPS)');
                },
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map_rounded, color: AppColors.primary, size: 32),
                      SizedBox(height: 4),
                      Text('Tocca per selezionare posizione', style: AppTextStyles.bodySmall),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Bottone crea
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(ctx);
                    SnackBarHelper.showSuccess(context, 'Evento creato (collegare al back office)');
                  },
                  icon: const Icon(Icons.event_available_rounded),
                  label: const Text('Crea Evento'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
