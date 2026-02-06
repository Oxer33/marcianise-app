import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

/// AppBar personalizzata per tutte le schermate
/// Mostra il logo del comune, il titolo e il pulsante menu
class ComuneAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titolo;
  final String? sottotitolo; // Es. 'MARCIANISE' sotto 'Comune di'
  final bool mostraBack;
  final List<Widget>? azioni;

  const ComuneAppBar({
    super.key,
    required this.titolo,
    this.sottotitolo,
    this.mostraBack = false,
    this.azioni,
  });

  @override
  Size get preferredSize => Size.fromHeight(sottotitolo != null ? 70 : 60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: false, // Allineato a sinistra come nello screenshot
      toolbarHeight: sottotitolo != null ? 70 : 60,
      leading: mostraBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            )
          : IconButton(
              icon: const Icon(Icons.menu_rounded, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo del comune (placeholder circolare)
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(
              Icons.account_balance_rounded,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          // Titolo (una o due righe)
          Flexible(
            child: sottotitolo != null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titolo,
                        style: AppTextStyles.appBarTitle.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        sottotitolo!,
                        style: AppTextStyles.appBarTitle.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  )
                : Text(
                    titolo,
                    style: AppTextStyles.appBarTitle,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
        ],
      ),
      actions: azioni ??
          [
            // Icona notifiche
            IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Colors.white),
              onPressed: () {
                // TODO: Implementare notifiche
              },
            ),
          ],
    );
  }
}
