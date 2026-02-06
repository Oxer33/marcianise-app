import 'package:flutter/material.dart';
import '../models/evento_model.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/constants/app_constants.dart';

/// Card per visualizzare un singolo evento
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          onTap: () {
            // TODO: Navigare al dettaglio evento
          },
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Badge categoria
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
                      Icon(
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
      ),
    );
  }
}
