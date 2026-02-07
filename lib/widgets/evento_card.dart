import 'package:flutter/material.dart';
import '../models/evento_model.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/constants/app_constants.dart';
import '../core/utils/snackbar_helper.dart';
import '../core/utils/localization_extension.dart';
import 'hoverable_card.dart';

/// Card per visualizzare un singolo evento (sez. 2.1 + 2.3)
/// 2.1. Visualizza Eventi
/// 2.3. Modifica/Elimina evento (PopupMenu)
/// Usata sia nella home che nella pagina Eventi
class EventoCard extends StatelessWidget {
  final EventoModel evento;
  final bool isCompact; // Versione compatta per la home

  const EventoCard({
    super.key,
    required this.evento,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCompact ? 200 : double.infinity,
      margin: EdgeInsets.only(
        bottom: isCompact ? 0 : AppConstants.paddingMedium,
        right: isCompact ? AppConstants.paddingMedium : 0,
      ),
      child: HoverableCard(
        onTap: () {
          // TODO: Navigare al dettaglio evento
          SnackBarHelper.showInfo(
            context,
            context.l10n.messageDetailComingSoon(evento.titolo),
          );
        },
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        // Superficie dinamica per supporto dark mode
        backgroundColor: AppColors.surface,
        normalShadow: AppColors.cardShadow,
        hoverShadow: AppColors.cardShadowHover,
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Badge categoria + menu modifica/elimina
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      evento.categoria,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // 2.3 - Menu modifica/elimina evento
                  if (!isCompact)
                    PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert_rounded, color: AppColors.textSecondary, size: 18),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onSelected: (value) {
                        if (value == 'modifica') {
                          SnackBarHelper.showInfo(
                            context,
                            context.l10n.messageBackOfficeEdit(evento.titolo),
                          );
                        } else if (value == 'elimina') {
                          SnackBarHelper.showWarning(
                            context,
                            context.l10n.messageBackOfficeDelete(evento.titolo),
                          );
                        }
                      },
                      itemBuilder: (ctx) => [
                        PopupMenuItem(
                          value: 'modifica',
                          child: Row(
                            children: [
                              const Icon(Icons.edit_rounded, size: 20),
                              const SizedBox(width: 8),
                              Text(context.l10n.actionEdit),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'elimina',
                          child: Row(
                            children: [
                              const Icon(Icons.delete_rounded, size: 20, color: Colors.red),
                              const SizedBox(width: 8),
                              Text(
                                context.l10n.actionDelete,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 8),

              // Titolo
              Text(
                evento.titolo,
                style: AppTextStyles.heading3,
                maxLines: isCompact ? 2 : 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),

              // Data e ora
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(evento.data, style: AppTextStyles.bodySmall),
                  const SizedBox(width: 12),
                  Icon(
                    Icons.access_time_rounded,
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(evento.ora, style: AppTextStyles.bodySmall),
                ],
              ),

              // Descrizione (solo versione completa)
              if (!isCompact) ...[
                const SizedBox(height: 8),
                Text(
                  evento.descrizione,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                // Luogo
                Row(
                  children: [
                    const Icon(
                      Icons.place_rounded,
                      size: 14,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        evento.luogo,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
