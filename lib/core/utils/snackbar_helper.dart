import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Helper centralizzato per mostrare SnackBar consistenti in tutta l'app
/// Uso: SnackBarHelper.showSuccess(context, 'Operazione completata!');
class SnackBarHelper {
  SnackBarHelper._();

  /// SnackBar di successo (verde)
  static void showSuccess(BuildContext context, String messaggio) {
    _show(context, messaggio, AppColors.success, Icons.check_circle_rounded);
  }

  /// SnackBar di errore (rosso)
  static void showError(BuildContext context, String messaggio) {
    _show(context, messaggio, AppColors.error, Icons.error_rounded);
  }

  /// SnackBar informativo (primary verde scuro)
  static void showInfo(BuildContext context, String messaggio) {
    _show(context, messaggio, AppColors.primary, Icons.info_rounded);
  }

  /// SnackBar di avviso (arancione)
  static void showWarning(BuildContext context, String messaggio) {
    _show(context, messaggio, AppColors.warning, Icons.warning_rounded);
  }

  /// Metodo privato per mostrare la SnackBar con stile uniforme
  static void _show(
    BuildContext context,
    String messaggio,
    Color colore,
    IconData icona,
  ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icona, color: AppColors.textOnPrimary, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                messaggio,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textOnPrimary,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: colore,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
