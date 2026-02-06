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
          // === SFONDO GRADIENTE BLU ===
          Container(
            width: double.infinity,
            height: AppConstants.heroImageHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryDark,
                  AppColors.primary.withValues(alpha: 0.9),
                  AppColors.primary.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),

          // === SKYLINE SILHOUETTE CITTÀ (effetto con icone) ===
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: _buildSkylineSilhouette(),
          ),

          // === PLACEHOLDER FOTO MUNICIPIO ===
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icona municipio grande
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.account_balance_rounded,
                      size: 50,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Municipio di Marcianise',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Immagine caricata dal back office',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.4),
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
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

  /// Costruisce una silhouette stilizzata della città
  /// Effetto decorativo come nello screenshot blu
  Widget _buildSkylineSilhouette() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Edifici stilizzati con Container
        _buildEdificio(30, 45),
        _buildEdificio(20, 60),
        _buildEdificio(25, 35),
        _buildEdificio(18, 80), // Torre/campanile
        _buildEdificio(30, 50),
        _buildEdificio(22, 40),
        _buildEdificio(28, 55),
        _buildEdificio(18, 70),
        _buildEdificio(25, 45),
        _buildEdificio(20, 35),
        _buildEdificio(30, 50),
        _buildEdificio(22, 65),
        _buildEdificio(25, 40),
      ],
    );
  }

  /// Singolo "edificio" della silhouette
  Widget _buildEdificio(double larghezza, double altezza) {
    return Container(
      width: larghezza,
      height: altezza,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(2),
        ),
      ),
    );
  }
}
