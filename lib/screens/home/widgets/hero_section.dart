import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../widgets/meteo_widget.dart';

/// Sezione hero della home page
/// Mostra la FOTO REALE del Municipio di Marcianise con meteo sovrapposto
/// La foto è caricata da assets/images/municipio_marcianise.jpeg
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.heroImageHeight,
      width: double.infinity,
      child: Stack(
        children: [
          // === FOTO REALE DEL MUNICIPIO DI MARCIANISE ===
          SizedBox(
            width: double.infinity,
            height: AppConstants.heroImageHeight,
            child: Image.asset(
              'assets/images/municipio_marcianise.jpeg',
              fit: BoxFit.cover,
              // Fallback in caso di errore caricamento immagine
              errorBuilder: (context, error, stackTrace) {
                return Container(
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
                  child: Center(
                    child: Icon(
                      Icons.account_balance_rounded,
                      size: 80,
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                  ),
                );
              },
            ),
          ),

          // === OVERLAY VERDE IN ALTO per continuità con AppBar ===
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryDark.withValues(alpha: 0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // === OVERLAY SCURO IN BASSO per leggibilità meteo ===
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.5),
                  ],
                ),
              ),
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
