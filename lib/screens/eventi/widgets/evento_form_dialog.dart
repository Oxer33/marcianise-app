import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../../core/utils/localization_extension.dart';

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
              Text(context.l10n.eventFormTitle, style: AppTextStyles.heading2),
              const SizedBox(height: 16),
              // 2.2.1 - Titolo
              TextField(
                decoration: InputDecoration(
                  labelText: context.l10n.eventFormTitleLabel,
                  prefixIcon: const Icon(Icons.title_rounded),
                ),
              ),
              const SizedBox(height: 12),
              // 2.2.2 - Contenuto
              TextField(
                decoration: InputDecoration(
                  labelText: context.l10n.eventFormContentLabel,
                  prefixIcon: const Icon(Icons.edit_note_rounded),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              // Data evento
              TextField(
                decoration: InputDecoration(
                  labelText: context.l10n.eventFormDateLabel,
                  prefixIcon: const Icon(Icons.calendar_today_rounded),
                  hintText: context.l10n.eventFormDateHint,
                ),
              ),
              const SizedBox(height: 12),
              // 2.2.3 - Geolocalizzazione
              Text(context.l10n.eventFormGeoTitle, style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  SnackBarHelper.showInfo(
                    context,
                    context.l10n.messageSelectLocationGps,
                  );
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.map_rounded, color: AppColors.primary, size: 32),
                      const SizedBox(height: 4),
                      Text(
                        context.l10n.eventFormGeoHint,
                        style: AppTextStyles.bodySmall,
                      ),
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
                    SnackBarHelper.showSuccess(
                      context,
                      context.l10n.messageEventCreated,
                    );
                  },
                  icon: const Icon(Icons.event_available_rounded),
                  label: Text(context.l10n.eventFormSubmit),
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
