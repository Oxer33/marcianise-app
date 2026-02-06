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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 90 || constraints.maxHeight < 110;
        final iconBoxSize = isCompact ? 48.0 : 56.0;
        final iconSize = isCompact ? 24.0 : 30.0;
        final spacing = isCompact ? 6.0 : 8.0;
        final titleStyle = AppTextStyles.cardTitle.copyWith(
          fontSize: isCompact ? 11 : 13,
          height: isCompact ? 1.15 : 1.3,
        );

        return GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(servizio.rotta),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.96, end: 1),
            duration: AppConstants.animationNormal,
            builder: (context, value, child) => Opacity(
              opacity: value,
              child: Transform.scale(scale: value, child: child),
            ),
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
                    width: iconBoxSize,
                    height: iconBoxSize,
                    decoration: BoxDecoration(
                      color: servizio.coloreSfondo,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      servizio.icona,
                      color: servizio.coloreIcona,
                      size: iconSize,
                    ),
                  ),
                  SizedBox(height: spacing),
                  // Titolo servizio
                  Text(
                    servizio.titolo,
                    style: titleStyle,
                    textAlign: TextAlign.center,
                    maxLines: isCompact ? 1 : 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
