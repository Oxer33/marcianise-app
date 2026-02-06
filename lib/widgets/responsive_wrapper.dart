import 'package:flutter/material.dart';

/// Wrapper responsive che limita la larghezza del contenuto
/// su schermi grandi (tablet, desktop, web)
/// In questo modo l'app sembra sempre un'app mobile centrata
class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const ResponsiveWrapper({
    super.key,
    required this.child,
    this.maxWidth = 500, // Larghezza massima simile a uno smartphone
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Se lo schermo è più largo del massimo, centra il contenuto
        if (constraints.maxWidth > maxWidth) {
          return Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              decoration: BoxDecoration(
                // Ombra laterale per effetto "telefono"
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: ClipRRect(
                child: child,
              ),
            ),
          );
        }
        // Su mobile, usa tutta la larghezza
        return child;
      },
    );
  }
}
