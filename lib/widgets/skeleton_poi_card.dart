import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import 'skeleton_box.dart';

/// Skeleton card per i Punti di Interesse (POI).
class SkeletonPoiCard extends StatelessWidget {
  const SkeletonPoiCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        boxShadow: AppColors.cardShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icona placeholder
            SkeletonBox(
              width: 56,
              height: 56,
              borderRadius: BorderRadius.circular(12),
            ),
            const SizedBox(width: 12),
            // Testo placeholder
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonBox(
                    width: double.infinity,
                    height: 16,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  const SizedBox(height: 8),
                  SkeletonBox(
                    width: double.infinity,
                    height: 12,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  const SizedBox(height: 8),
                  SkeletonBox(
                    width: 140,
                    height: 12,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            SkeletonBox(
              width: 18,
              height: 18,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      ),
    );
  }
}
