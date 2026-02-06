import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/mock_data.dart';
import '../../../widgets/servizio_card.dart';

/// Griglia dei 6 servizi rapidi nella home page
/// Layout 3 colonne x 2 righe come nell'app blu di riferimento
/// Container con sfondo azzurro chiaro e bordi arrotondati
class ServiziGrid extends StatelessWidget {
  const ServiziGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final servizi = MockData.servizi;

    return Container(
      // Sfondo azzurro chiaro come nello screenshot blu
      margin: const EdgeInsets.fromLTRB(
        AppConstants.paddingMedium,
        AppConstants.paddingMedium,
        AppConstants.paddingMedium,
        AppConstants.paddingSmall,
      ),
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.cardService1.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
      ),
      child: GridView.builder(
        // Non deve scrollare da solo, è dentro SingleChildScrollView
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: servizi.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AppConstants.serviziCrossAxisCount,
          crossAxisSpacing: AppConstants.serviziSpacing,
          mainAxisSpacing: AppConstants.serviziSpacing,
          childAspectRatio: 0.85, // Card più alte che larghe
        ),
        itemBuilder: (context, index) {
          return ServizioCard(servizio: servizi[index]);
        },
      ),
    );
  }
}
