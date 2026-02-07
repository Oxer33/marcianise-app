import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import 'skeleton_box.dart';

/// Skeleton card per le news (usato durante il refresh/caricamento).
class SkeletonNewsCard extends StatelessWidget {
  final bool isCompact;

  const SkeletonNewsCard({
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
            // Riga data + badge
            Row(
              children: [
                SkeletonBox(
                  width: 80,
                  height: 12,
                  borderRadius: BorderRadius.circular(6),
                ),
                const Spacer(),
                if (!isCompact)
                  SkeletonBox(
                    width: 54,
                    height: 12,
                    borderRadius: BorderRadius.circular(6),
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
            // Descrizione
            if (!isCompact)
              SkeletonBox(
                width: double.infinity,
                height: 12,
                borderRadius: BorderRadius.circular(6),
              ),
          ],
        ),
      ),
    );
  }
}
