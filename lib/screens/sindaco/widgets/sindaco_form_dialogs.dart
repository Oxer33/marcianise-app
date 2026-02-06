import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/snackbar_helper.dart';

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
            const Text('Carica Immagini', style: AppTextStyles.heading2),
            const SizedBox(height: 16),
            // Area upload
            GestureDetector(
              onTap: () {
                Navigator.pop(ctx);
                SnackBarHelper.showInfo(context, 'Upload immagini sarà gestito dal back office');
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
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload_rounded, color: AppColors.primary, size: 40),
                    SizedBox(height: 8),
                    Text('Tocca per selezionare immagini', style: AppTextStyles.bodyMedium),
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
            const Text('Carica Video', style: AppTextStyles.heading2),
            const SizedBox(height: 16),
            // Area upload video
            GestureDetector(
              onTap: () {
                Navigator.pop(ctx);
                SnackBarHelper.showInfo(context, 'Upload video sarà gestito dal back office');
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
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.video_call_rounded, color: Color(0xFFC62828), size: 40),
                    SizedBox(height: 8),
                    Text('Tocca per selezionare un video', style: AppTextStyles.bodyMedium),
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
            const Text('Nuovo Comunicato', style: AppTextStyles.heading2),
            const SizedBox(height: 16),
            // Campo titolo
            const TextField(
              decoration: InputDecoration(
                labelText: 'Titolo del comunicato',
                prefixIcon: Icon(Icons.title_rounded),
              ),
            ),
            const SizedBox(height: 12),
            // Campo contenuto
            const TextField(
              decoration: InputDecoration(
                labelText: 'Contenuto del comunicato',
                prefixIcon: Icon(Icons.edit_note_rounded),
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
                  SnackBarHelper.showSuccess(context, 'Comunicato inserito (collegare al back office)');
                },
                icon: const Icon(Icons.send_rounded),
                label: const Text('Pubblica Comunicato'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
