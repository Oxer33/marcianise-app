import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/snackbar_helper.dart';

/// Form dialog per creare un nuovo Punto di Interesse (sez. 3.1)
/// Estratto da luoghi_interesse_screen.dart per modularità
/// 3.1.1. Nome | 3.1.2. Descrizione | 3.1.3. Geolocalizzazione
class PoiFormDialog {
  PoiFormDialog._();

  /// 3.1 - Mostra il form per creare un nuovo POI
  static void mostraFormCreaPOI(BuildContext context) {
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
              const Text('Crea Nuovo POI', style: AppTextStyles.heading2),
              const SizedBox(height: 16),
              // 3.1.1 - Nome
              const TextField(
                decoration: InputDecoration(
                  labelText: '3.1.1 Nome del punto di interesse',
                  prefixIcon: Icon(Icons.place_rounded),
                ),
              ),
              const SizedBox(height: 12),
              // 3.1.2 - Descrizione
              const TextField(
                decoration: InputDecoration(
                  labelText: '3.1.2 Descrizione',
                  prefixIcon: Icon(Icons.description_rounded),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              // 3.1.3 - Geolocalizzazione
              const Text('3.1.3 Geolocalizzazione', style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  SnackBarHelper.showInfo(context, 'Seleziona posizione sulla mappa (collegare GPS)');
                },
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6A1B9A).withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF6A1B9A).withValues(alpha: 0.3),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map_rounded, color: Color(0xFF6A1B9A), size: 32),
                      SizedBox(height: 4),
                      Text('Tocca per selezionare posizione', style: AppTextStyles.bodySmall),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Bottone salva
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(ctx);
                    SnackBarHelper.showSuccess(context, 'POI creato (collegare al back office)');
                  },
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('Salva POI'),
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
