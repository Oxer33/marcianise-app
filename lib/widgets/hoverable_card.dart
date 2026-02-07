import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';

/// Card interattiva con micro-interazioni (hover + lift + glow).
/// Usata per web/desktop senza dipendenze esterne.
class HoverableCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Gradient? backgroundGradient;
  final List<BoxShadow> normalShadow;
  final List<BoxShadow> hoverShadow;
  final Duration duration;
  final double hoverScale;
  final double hoverLift;

  const HoverableCard({
    super.key,
    required this.child,
    required this.borderRadius,
    required this.backgroundColor,
    this.backgroundGradient,
    required this.normalShadow,
    required this.hoverShadow,
    this.onTap,
    this.duration = AppConstants.animationFast,
    this.hoverScale = 1.02,
    this.hoverLift = 4,
  });

  @override
  State<HoverableCard> createState() => _HoverableCardState();
}

class _HoverableCardState extends State<HoverableCard> {
  bool _isHovered = false;

  void _setHover(bool value) {
    if (_isHovered == value) return;
    setState(() => _isHovered = value);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: AnimatedContainer(
        duration: widget.duration,
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(
          0,
          _isHovered ? -widget.hoverLift : 0,
          0,
        ),
        decoration: BoxDecoration(
          color: widget.backgroundGradient == null ? widget.backgroundColor : null,
          gradient: widget.backgroundGradient,
          borderRadius: widget.borderRadius,
          boxShadow: _isHovered ? widget.hoverShadow : widget.normalShadow,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: widget.borderRadius,
            onTap: widget.onTap,
            child: AnimatedScale(
              duration: widget.duration,
              curve: Curves.easeOut,
              scale: _isHovered ? widget.hoverScale : 1.0,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
