import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../widgets/evento_card.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../data/mock_data.dart';

/// Modulo C - Eventi, manifestazioni e iniziative del territorio
/// Mostra gli eventi in programma e quelli passati
/// Con filtro per data e categoria
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
}
