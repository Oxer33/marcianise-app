import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import 'hoverable_card.dart';

/// Card scenografica per la sezione "In evidenza" (stile bento).
class HighlightCard extends StatelessWidget {
  final String title;
  final String description;
  final InlineSpan? descriptionSpan;
  final IconData icon;
  final Gradient gradient;
  final double height;
  final VoidCallback? onTap;
  final Color textColor;

  const HighlightCard({
    super.key,
    required this.title,
    required this.description,
    this.descriptionSpan,
    required this.icon,
    required this.gradient,
    required this.height,
    this.onTap,
    this.textColor = AppColors.textOnPrimary,
  });

  @override
  Widget build(BuildContext context) {
    final baseDescriptionStyle = AppTextStyles.bodySmall.copyWith(
      color: textColor.withValues(alpha: 0.9),
      height: 1.3,
    );

    return HoverableCard(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
      backgroundColor: AppColors.surface,
      backgroundGradient: gradient,
      normalShadow: AppColors.cardShadow,
      hoverShadow: AppColors.cardShadowHover,
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.textOnPrimary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: textColor, size: 20),
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_rounded, color: textColor.withValues(alpha: 0.7), size: 16),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: AppTextStyles.heading3.copyWith(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              if (descriptionSpan == null)
                Text(
                  description,
                  style: baseDescriptionStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              else
                Text.rich(
                  TextSpan(
                    style: baseDescriptionStyle,
                    children: [descriptionSpan!],
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
