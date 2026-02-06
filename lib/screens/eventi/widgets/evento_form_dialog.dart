import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/snackbar_helper.dart';

/// Form dialog per creare un nuovo evento (sez. 2.2)
/// Estratto da eventi_screen.dart per modularità
/// 2.2.1. Titolo | 2.2.2. Contenuto | 2.2.3. Geolocalizzazione
class EventoFormDialog {
  EventoFormDialog._();

  /// 2.2 - Mostra il form per creare un nuovo evento
  static void mostraFormCreaEvento(BuildContext context) {
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
