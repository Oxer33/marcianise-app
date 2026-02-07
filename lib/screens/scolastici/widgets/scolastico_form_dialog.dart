import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../../core/utils/localization_extension.dart';

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
            Text(context.l10n.scolasticoFormTitle, style: AppTextStyles.heading2),
            const SizedBox(height: 16),
            // Nome servizio
            TextField(
              decoration: InputDecoration(
                labelText: context.l10n.scolasticoFormNameLabel,
                prefixIcon: const Icon(Icons.school_rounded),
              ),
            ),
            const SizedBox(height: 12),
            // Descrizione
            TextField(
              decoration: InputDecoration(
                labelText: context.l10n.scolasticoFormDescriptionLabel,
                prefixIcon: const Icon(Icons.description_rounded),
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
                  SnackBarHelper.showSuccess(
                    context,
                    context.l10n.messageScolasticoCreated,
                  );
                },
                icon: const Icon(Icons.save_rounded),
                label: Text(context.l10n.scolasticoFormSubmit),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
