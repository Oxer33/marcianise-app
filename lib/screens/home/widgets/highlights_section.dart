import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/highlight_card.dart';
import '../../../core/utils/localization_extension.dart';

/// Sezione "In evidenza" con layout bento per la home.
class HighlightsSection extends StatelessWidget {
  const HighlightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(context.l10n.homeHighlightsTitle, style: AppTextStyles.sectionTitle),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              const spacing = AppConstants.paddingSmall;
              if (constraints.maxWidth >= 900) {
                const largeHeight = 220.0;
                const smallHeight = (largeHeight - spacing) / 2;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildNewsCard(context, height: largeHeight),
                    ),
                    const SizedBox(width: spacing),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          _buildServiziCard(context, height: smallHeight),
                          const SizedBox(height: spacing),
                          _buildEventiCard(context, height: smallHeight),
                        ],
                      ),
                    ),
                  ],
                );
              }

              if (constraints.maxWidth >= 600) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildNewsCard(context, height: 170),
                        ),
                        const SizedBox(width: spacing),
                        Expanded(
                          child: _buildServiziCard(context, height: 170),
                        ),
                      ],
                    ),
                    const SizedBox(height: spacing),
                    _buildEventiCard(context, height: 150),
                  ],
                );
              }

              return Column(
                children: [
                  _buildNewsCard(context, height: 160),
                  const SizedBox(height: spacing),
                  _buildServiziCard(context, height: 160),
                  const SizedBox(height: spacing),
                  _buildEventiCard(context, height: 160),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(BuildContext context, {required double height}) {
    return HighlightCard(
      title: context.l10n.highlightNewsTitle,
      description: '',
      descriptionSpan: TextSpan(
        children: [
          TextSpan(text: context.l10n.highlightNewsPrefix),
          TextSpan(
            text: context.l10n.highlightNewsEmphasis,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          TextSpan(text: context.l10n.highlightNewsSuffix),
        ],
      ),
      icon: Icons.campaign_rounded,
      gradient: const LinearGradient(
        colors: [
          AppColors.primaryDark,
          AppColors.primary,
        ],
      ),
      height: height,
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.newsAvvisi),
    );
  }

  Widget _buildServiziCard(BuildContext context, {required double height}) {
    return HighlightCard(
      title: context.l10n.highlightServicesTitle,
      description: '',
      descriptionSpan: TextSpan(
        children: [
          TextSpan(text: context.l10n.highlightServicesPrefix),
          TextSpan(
            text: context.l10n.highlightServicesEmphasis,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          TextSpan(text: context.l10n.highlightServicesSuffix),
        ],
      ),
      icon: Icons.cloud_done_rounded,
      gradient: const LinearGradient(
        colors: [
          AppColors.cardService2,
          AppColors.cardService4,
        ],
      ),
      height: height,
      textColor: AppColors.textPrimary,
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.serviziOnline),
    );
  }

  Widget _buildEventiCard(BuildContext context, {required double height}) {
    return HighlightCard(
      title: context.l10n.highlightEventsTitle,
      description: '',
      descriptionSpan: TextSpan(
        children: [
          TextSpan(text: context.l10n.highlightEventsPrefix),
          TextSpan(
            text: context.l10n.highlightEventsEmphasis,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          TextSpan(text: context.l10n.highlightEventsSuffix),
        ],
      ),
      icon: Icons.auto_awesome_rounded,
      gradient: const LinearGradient(
        colors: [
          AppColors.cardService3,
          AppColors.cardService5,
        ],
      ),
      height: height,
      textColor: AppColors.textPrimary,
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.eventi),
    );
  }
}
