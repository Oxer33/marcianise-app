import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../../core/utils/localization_extension.dart';

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
              Text(context.l10n.newsFormTitle, style: AppTextStyles.heading2),
              const SizedBox(height: 16),
              // 1.1.1 - Titolo
              TextField(
                decoration: InputDecoration(
                  labelText: context.l10n.newsFormTitleLabel,
                  prefixIcon: const Icon(Icons.title_rounded),
                ),
              ),
              const SizedBox(height: 12),
              // 1.1.2 - Contenuto
              TextField(
                decoration: InputDecoration(
                  labelText: context.l10n.newsFormContentLabel,
                  prefixIcon: const Icon(Icons.edit_note_rounded),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 12),
              // 1.1.3 - Criticità
              Text(context.l10n.newsFormCriticalityTitle, style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              // Selettore criticità
              Row(
                children: [
                  _buildCriticitaChip(context.l10n.criticalityLow, Colors.green),
                  const SizedBox(width: 8),
                  _buildCriticitaChip(context.l10n.criticalityMedium, Colors.orange),
                  const SizedBox(width: 8),
                  _buildCriticitaChip(context.l10n.criticalityHigh, Colors.red),
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
                        context.l10n.newsFormNotificationInfo,
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
                    SnackBarHelper.showSuccess(
                      context,
                      context.l10n.messageNewsCreated,
                    );
                  },
                  icon: const Icon(Icons.publish_rounded),
                  label: Text(context.l10n.newsFormSubmit),
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
