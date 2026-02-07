import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import 'widgets/hero_section.dart';
import 'widgets/highlights_section.dart';
import 'widgets/servizi_grid.dart';
import 'widgets/novita_eventi_section.dart';
import '../../core/utils/localization_extension.dart';

/// Schermata principale (Home) dell'app
/// Layout con tema verde scuro istituzionale:
/// 1. Hero image REALE del municipio con meteo
/// 2. Griglia 8 servizi rapidi (5 moduli MTK + sindaco + scolastici + servizi)
/// 3. Sezione Novità / Eventi in basso
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar con menu hamburger e logo
      appBar: ComuneAppBar(
        titolo: context.l10n.homeTitleComune,
        sottotitolo: context.l10n.homeSubtitleCity,
      ),
      // Drawer laterale
      drawer: const ComuneDrawer(),
      // Corpo della pagina - scrollabile
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Hero image con meteo sovrapposto
            HeroSection(),

            // 1.5 Sezione In evidenza (bento + micro-interazioni)
            HighlightsSection(),

            // 2. Griglia servizi (8 card)
            ServiziGrid(),

            // 3. Sezione Novità e Eventi
            NovitaEventiSection(),

            // Spazio in basso per respiro
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
