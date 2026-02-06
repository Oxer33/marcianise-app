import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/snackbar_helper.dart';

/// Form dialog per creare una nuova notizia (sez. 1.1)
/// Estratto da news_screen.dart per modularità
/// 1.1.1. Titolo | 1.1.2. Contenuto | 1.1.3. Criticità | 1.1.3.1 Notifica
class NotiziaFormDialog {
  NotiziaFormDialog._();

  /// 1.1 - Mostra il form per creare una nuova notizia
  static void mostraFormCreaNotizia(BuildContext context) {
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
              const Text('Crea Notizia', style: AppTextStyles.heading2),
              const SizedBox(height: 16),
              // 1.1.1 - Titolo
              const TextField(
                decoration: InputDecoration(
                  labelText: '1.1.1 Titolo della notizia',
                  prefixIcon: Icon(Icons.title_rounded),
                ),
              ),
              const SizedBox(height: 12),
              // 1.1.2 - Contenuto
              const TextField(
                decoration: InputDecoration(
                  labelText: '1.1.2 Contenuto della notizia',
                  prefixIcon: Icon(Icons.edit_note_rounded),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 12),
              // 1.1.3 - Criticità
              const Text('1.1.3 Criticità', style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              // Selettore criticità
              Row(
                children: [
                  _buildCriticitaChip('Bassa', Colors.green),
                  const SizedBox(width: 8),
                  _buildCriticitaChip('Media', Colors.orange),
                  const SizedBox(width: 8),
                  _buildCriticitaChip('Alta', Colors.red),
                ],
              ),
              const SizedBox(height: 8),
              // 1.1.3.1 - Info notifica
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.info.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.notifications_active_rounded, color: AppColors.info, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '1.1.3.1 La notifica push verrà inviata automaticamente in base alla criticità selezionata.',
                        style: AppTextStyles.bodySmall.copyWith(color: AppColors.info),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Bottone pubblica
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(ctx);
                    SnackBarHelper.showSuccess(context, 'Notizia creata (collegare al back office)');
                  },
                  icon: const Icon(Icons.publish_rounded),
                  label: const Text('Pubblica Notizia'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  /// Chip per selezionare la criticità della notizia
  static Widget _buildCriticitaChip(String label, Color colore) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: colore.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colore.withValues(alpha: 0.3)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: colore,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
