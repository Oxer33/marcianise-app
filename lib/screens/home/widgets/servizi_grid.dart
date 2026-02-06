import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/mock_data.dart';
import '../../../widgets/servizio_card.dart';

/// Griglia dei 6 servizi rapidi nella home page
/// Layout RESPONSIVE: 3 colonne su mobile, 4 su tablet, 6 su desktop
/// Container con sfondo verde chiaro e bordi arrotondati
class ServiziGrid extends StatelessWidget {
  const ServiziGrid({super.key});

  /// Calcola il numero di colonne in base alla larghezza dello schermo
  int _calcolaColonne(double larghezza) {
    if (larghezza >= 900) return 6; // Desktop: una riga unica
    if (larghezza >= 600) return 4; // Tablet: 2 righe da 3+3 → 4+2
    return 3; // Mobile: 3 colonne x 2 righe
  }

  @override
  Widget build(BuildContext context) {
    final servizi = MockData.servizi;
    final larghezzaSchermo = MediaQuery.of(context).size.width;
    final colonne = _calcolaColonne(larghezzaSchermo);

    return Container(
      // Sfondo verde chiaro istituzionale
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: colonne,
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
