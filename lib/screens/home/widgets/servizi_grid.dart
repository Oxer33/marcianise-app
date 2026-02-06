import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/mock_data.dart';
import '../../../widgets/servizio_card.dart';

/// Griglia dei 6 servizi rapidi nella home page
/// Layout 3 colonne x 2 righe come nell'app di riferimento
class ServiziGrid extends StatelessWidget {
  const ServiziGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final servizi = MockData.servizi;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppConstants.paddingMedium,
        AppConstants.paddingLarge,
        AppConstants.paddingMedium,
        AppConstants.paddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titolo sezione (opzionale, come nell'app di riferimento non c'è)
          // Ma lo lasciamo per chiarezza
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text('Servizi', style: AppTextStyles.sectionTitle),
          ),

          // Griglia servizi 3x2
          GridView.builder(
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
        ],
      ),
    );
  }
}
