import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import 'skeleton_box.dart';

/// Skeleton card per gli eventi (usato durante il refresh/caricamento).
class SkeletonEventoCard extends StatelessWidget {
  final bool isCompact;

  const SkeletonEventoCard({
    super.key,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppConstants.borderRadiusMedium);

    return Container(
      width: isCompact ? 200 : double.infinity,
      margin: EdgeInsets.only(
        bottom: isCompact ? 0 : AppConstants.paddingMedium,
        right: isCompact ? AppConstants.paddingMedium : 0,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: radius,
        boxShadow: AppColors.cardShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categoria + menu
            Row(
              children: [
                SkeletonBox(
                  width: 90,
                  height: 16,
                  borderRadius: BorderRadius.circular(10),
                ),
                const Spacer(),
                if (!isCompact)
                  SkeletonBox(
                    width: 18,
                    height: 18,
                    borderRadius: BorderRadius.circular(4),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            // Titolo
            SkeletonBox(
              width: double.infinity,
              height: 16,
              borderRadius: BorderRadius.circular(6),
            ),
            const SizedBox(height: 8),
            // Data e ora
            Row(
              children: [
                SkeletonBox(
                  width: 80,
                  height: 12,
                  borderRadius: BorderRadius.circular(6),
                ),
                const SizedBox(width: 12),
                SkeletonBox(
                  width: 60,
                  height: 12,
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
            if (!isCompact) ...[
              const SizedBox(height: 10),
              // Descrizione
              SkeletonBox(
                width: double.infinity,
                height: 12,
                borderRadius: BorderRadius.circular(6),
              ),
              const SizedBox(height: 8),
              // Luogo
              SkeletonBox(
                width: 140,
                height: 12,
                borderRadius: BorderRadius.circular(6),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
