import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../widgets/meteo_widget.dart';

/// Sezione hero della home page
/// Mostra l'immagine del municipio con le previsioni meteo sovrapposte
/// Ispirato allo stile dell'app blu di San Donà di Piave
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.heroImageHeight,
      width: double.infinity,
      child: Stack(
        children: [
          // === IMMAGINE MUNICIPIO (Placeholder con gradiente) ===
          Container(
            width: double.infinity,
            height: AppConstants.heroImageHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryDark,
                  AppColors.primary.withValues(alpha: 0.8),
                ],
              ),
            ),
            child: Stack(
              children: [
                // Placeholder icona municipio
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_rounded,
                        size: 80,
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Municipio di Marcianise',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '(Immagine dal back office)',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.3),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                // === OVERLAY SCURO IN BASSO ===
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.6),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // === WIDGET METEO SOVRAPPOSTO IN BASSO ===
          const Positioned(
            bottom: 12,
            left: 16,
            right: 16,
            child: MeteoWidget(),
          ),
        ],
      ),
    );
  }
}
