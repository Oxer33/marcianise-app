import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../../core/utils/localization_extension.dart';

/// Form dialogs per la sezione Comunicazioni Sindaco (sez.4)
/// Estratti dal file principale per modularità
/// 4.1. Carica immagini | 4.2. Carica video | 4.3. Inserisci Comunicati
class SindacoFormDialogs {
  SindacoFormDialogs._();

  /// 4.1 - Form per caricare immagini
  static void mostraFormImmagini(BuildContext context) {
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
            Text(context.l10n.sindacoFormImagesTitle, style: AppTextStyles.heading2),
            const SizedBox(height: 16),
            // Area upload
            GestureDetector(
              onTap: () {
                Navigator.pop(ctx);
                SnackBarHelper.showInfo(
                  context,
                  context.l10n.messageBackOfficeImagesUpload,
                );
              },
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primary.withValues(alpha: 0.05),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.cloud_upload_rounded, color: AppColors.primary, size: 40),
                    const SizedBox(height: 8),
                    Text(
                      context.l10n.sindacoFormImagesHint,
                      style: AppTextStyles.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  /// 4.2 - Form per caricare video
  static void mostraFormVideo(BuildContext context) {
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
            Text(context.l10n.sindacoFormVideoTitle, style: AppTextStyles.heading2),
            const SizedBox(height: 16),
            // Area upload video
            GestureDetector(
              onTap: () {
                Navigator.pop(ctx);
                SnackBarHelper.showInfo(
                  context,
                  context.l10n.messageBackOfficeVideoUpload,
                );
              },
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFC62828).withValues(alpha: 0.3),
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFC62828).withValues(alpha: 0.05),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.video_call_rounded, color: Color(0xFFC62828), size: 40),
                    const SizedBox(height: 8),
                    Text(
                      context.l10n.sindacoFormVideoHint,
                      style: AppTextStyles.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  /// 4.3 - Form per inserire comunicati
  static void mostraFormComunicati(BuildContext context) {
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
            Text(context.l10n.sindacoFormComunicatoTitle, style: AppTextStyles.heading2),
            const SizedBox(height: 16),
            // Campo titolo
            TextField(
              decoration: InputDecoration(
                labelText: context.l10n.sindacoFormComunicatoTitleLabel,
                prefixIcon: const Icon(Icons.title_rounded),
              ),
            ),
            const SizedBox(height: 12),
            // Campo contenuto
            TextField(
              decoration: InputDecoration(
                labelText: context.l10n.sindacoFormComunicatoContentLabel,
                prefixIcon: const Icon(Icons.edit_note_rounded),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            // Bottone invio
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(ctx);
                  SnackBarHelper.showSuccess(
                    context,
                    context.l10n.messageComunicatoCreated,
                  );
                },
                icon: const Icon(Icons.send_rounded),
                label: Text(context.l10n.sindacoFormComunicatoSubmit),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
