import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/constants/app_constants.dart';

/// Card per visualizzare una singola notizia
/// Usata sia nella home che nella pagina News
class NewsCard extends StatelessWidget {
  final NewsModel news;
  final bool isCompact; // Versione compatta per la home

  const NewsCard({
    super.key,
    required this.news,
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
            // TODO: Navigare al dettaglio news
          },
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Riga data e badge urgente
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(news.data, style: AppTextStyles.bodySmall),
                    const Spacer(),
                    if (news.isUrgente)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Urgente',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.error,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),

                // Titolo
                Text(
                  news.titolo,
                  style: AppTextStyles.heading3,
                  maxLines: isCompact ? 2 : 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),

                // Descrizione
                if (!isCompact)
                  Text(
                    news.descrizione,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
