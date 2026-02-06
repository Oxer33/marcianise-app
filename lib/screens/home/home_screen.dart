import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import 'widgets/hero_section.dart';
import 'widgets/servizi_grid.dart';
import 'widgets/novita_eventi_section.dart';

/// Schermata principale (Home) dell'app
/// Layout ispirato all'app blu di San Donà di Piave:
/// 1. Hero image municipio con meteo
/// 2. Griglia 6 servizi rapidi
/// 3. Sezione Novità / Eventi in basso
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar con menu hamburger e logo
      appBar: const ComuneAppBar(
        titolo: 'Comune di',
        sottotitolo: 'MARCIANISE',
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

            // 2. Griglia servizi (6 card)
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
