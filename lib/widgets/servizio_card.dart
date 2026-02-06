import 'package:flutter/material.dart';
import '../models/servizio_model.dart';
import '../core/theme/app_text_styles.dart';
import '../core/constants/app_constants.dart';

/// Card singola per un servizio nella griglia della home
/// Mostra icona, titolo e colore di sfondo personalizzato
class ServizioCard extends StatelessWidget {
  final ServizioModel servizio;

  const ServizioCard({
    super.key,
    required this.servizio,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(servizio.rotta),
      child: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icona con sfondo colorato
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: servizio.coloreSfondo,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                servizio.icona,
                color: servizio.coloreIcona,
                size: 30,
              ),
            ),
            const SizedBox(height: 8),
            // Titolo servizio
            Text(
              servizio.titolo,
              style: AppTextStyles.cardTitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
