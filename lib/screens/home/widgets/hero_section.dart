import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/localization_extension.dart';
import '../../../widgets/meteo_widget.dart';
import '../../../widgets/parallax_image.dart';

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
    final heroHeight = _calcolaHeroHeight(context);

    return SizedBox(
      height: heroHeight,
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
              child: _buildHeroImage(_heroImages[_currentIndex], heroHeight),
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

          // === TAGLINE SCENOGRAFICO ===
          Positioned(
            left: 16,
            right: 16,
            bottom: 92,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: AppConstants.animationNormal,
              builder: (context, value, child) => Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, (1 - value) * 10),
                  child: child,
                ),
              ),
              child: _buildHeroTagline(),
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
  Widget _buildHeroImage(String path, double height) {
    return ParallaxImage(
      key: ValueKey(path),
      imagePath: path,
      height: height,
      semanticLabel: context.l10n.heroImageSemantic,
      fallbackBuilder: (context) => _buildHeroFallback(height),
    );
  }

  Widget _buildHeroFallback(double height) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Container(
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
            color: AppColors.textOnPrimary.withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroTagline() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.textOnPrimary.withValues(alpha: 0.2),
        ),
      ),
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textOnPrimary,
            height: 1.3,
          ),
          children: [
            TextSpan(text: context.l10n.heroTaglinePrefix),
            TextSpan(
              text: context.l10n.heroTaglineEmphasis,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            TextSpan(text: context.l10n.heroTaglineSuffix),
          ],
        ),
      ),
    );
  }

  double _calcolaHeroHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    var heroHeight = screenHeight * 0.36;
    if (heroHeight < AppConstants.heroImageHeight) {
      heroHeight = AppConstants.heroImageHeight;
    }
    if (heroHeight > 360) {
      heroHeight = 360;
    }
    return heroHeight;
  }
}
