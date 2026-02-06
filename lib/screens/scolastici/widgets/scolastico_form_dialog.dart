import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/snackbar_helper.dart';

/// Form dialog per aggiungere un nuovo servizio scolastico (sez. 5.1)
/// Estratto da servizi_scolastici_screen.dart per modularità
class ScolasticoFormDialog {
  ScolasticoFormDialog._();

  /// 5.1 - Mostra il form per aggiungere un nuovo servizio scolastico
  static void mostraFormNuovoServizio(BuildContext context) {
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Aggiungi Servizio Scolastico', style: AppTextStyles.heading2),
            const SizedBox(height: 16),
            // Nome servizio
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nome del servizio',
                prefixIcon: Icon(Icons.school_rounded),
              ),
            ),
            const SizedBox(height: 12),
            // Descrizione
            const TextField(
              decoration: InputDecoration(
                labelText: 'Descrizione del servizio',
                prefixIcon: Icon(Icons.description_rounded),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            // Bottone salva
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(ctx);
                  SnackBarHelper.showSuccess(context, 'Servizio aggiunto (collegare al back office)');
                },
                icon: const Icon(Icons.save_rounded),
                label: const Text('Salva Servizio'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
