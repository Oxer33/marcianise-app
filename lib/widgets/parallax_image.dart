import 'package:flutter/material.dart';

/// Immagine con effetto parallax verticale.
/// Funziona quando esiste uno Scrollable padre (es. Home).
class ParallaxImage extends StatelessWidget {
  final String imagePath;
  final double height;
  final BoxFit fit;
  final FilterQuality filterQuality;
  final String semanticLabel;
  final WidgetBuilder? fallbackBuilder;

  const ParallaxImage({
    super.key,
    required this.imagePath,
    required this.height,
    this.fit = BoxFit.cover,
    this.filterQuality = FilterQuality.high,
    this.semanticLabel = '',
    this.fallbackBuilder,
  });

  Widget _buildImage(BuildContext context, {Key? key}) {
    return Image.asset(
      imagePath,
      key: key,
      fit: fit,
      width: double.infinity,
      height: height,
      filterQuality: filterQuality,
      semanticLabel: semanticLabel.isEmpty ? null : semanticLabel,
      // Fallback immagine se asset non disponibile.
      errorBuilder: (context, error, stackTrace) {
        return fallbackBuilder?.call(context) ?? const SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final scrollable = Scrollable.maybeOf(context);

    // Se non c'e' scrollabile, mostra immagine statica.
    if (scrollable == null) {
      return SizedBox(
        height: height,
        width: double.infinity,
        child: _buildImage(context),
      );
    }

    final backgroundImageKey = GlobalKey();

    return SizedBox(
      height: height,
      width: double.infinity,
      child: ClipRect(
        child: Flow(
          delegate: ParallaxFlowDelegate(
            scrollable: scrollable,
            listItemContext: context,
            backgroundImageKey: backgroundImageKey,
          ),
          children: [
            _buildImage(context, key: backgroundImageKey),
          ],
        ),
      ),
    );
  }
}

/// FlowDelegate che sposta l'immagine in base allo scroll.
class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject();
    final listItemBox = listItemContext.findRenderObject();

    if (scrollableBox is! RenderBox || listItemBox is! RenderBox) {
      context.paintChild(0);
      return;
    }

    // Posizione del widget dentro lo Scrollable.
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    // Percentuale di scorrimento (0 = top, 1 = bottom).
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Allineamento verticale per effetto parallax.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    final backgroundRenderObject = backgroundImageKey.currentContext?.findRenderObject();
    final backgroundSize = backgroundRenderObject is RenderBox ? backgroundRenderObject.size : context.size;
    final listItemSize = context.size;

    final childRect = verticalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    // Dipinge l'immagine con offset verticale.
    context.paintChild(
      0,
      transform: Transform.translate(
        offset: Offset(0.0, childRect.top),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }
}
