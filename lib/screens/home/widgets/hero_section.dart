import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../widgets/meteo_widget.dart';

/// Sezione hero della home page
/// Carousel animato con immagini ufficiali del Comune + meteo sovrapposto
/// Immagini da assets/images (municipio + banner ufficiali)
class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  // Immagini ufficiali del Comune (hero + banner dal sito)
  final List<String> _heroImages = [
    'assets/images/municipio_marcianise.jpeg',
    'assets/images/hero_banner_1.jpg',
    'assets/images/hero_banner_2.jpg',
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Carousel automatico per effetto wow
    _timer = Timer.periodic(const Duration(seconds: 6), (_) {
      if (!mounted) return;
      setState(() {
        _currentIndex = (_currentIndex + 1) % _heroImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.heroImageHeight,
      width: double.infinity,
      child: Stack(
        children: [
          // === CAROUSEL IMMAGINI HERO (fade + scale) ===
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: AppConstants.animationSlow,
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                final fade = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
                return FadeTransition(
                  opacity: fade,
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 1.02, end: 1.0).animate(fade),
                    child: child,
                  ),
                );
              },
              child: _buildHeroImage(_heroImages[_currentIndex]),
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
          Positioned(
            bottom: 12,
            left: 16,
            right: 16,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: AppConstants.animationNormal,
              builder: (context, value, child) => Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, (1 - value) * 8),
                  child: child,
                ),
              ),
              child: const MeteoWidget(),
            ),
          ),
        ],
      ),
    );
  }

  /// Costruisce l'immagine hero con fallback elegante
  Widget _buildHeroImage(String path) {
    return SizedBox(
      key: ValueKey(path),
      width: double.infinity,
      height: AppConstants.heroImageHeight,
      child: Image.asset(
        path,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
        semanticLabel: 'Immagine ufficiale del Comune di Marcianise',
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
    );
  }
}
