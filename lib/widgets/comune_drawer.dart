import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/constants/app_constants.dart';
import '../core/routes/app_routes.dart';

/// Drawer laterale (menu hamburger) dell'app
/// Mostra tutte le sezioni navigabili dell'applicazione
class ComuneDrawer extends StatelessWidget {
  const ComuneDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            // === HEADER DRAWER ===
            _buildHeader(),
            const Divider(height: 1),

            // === MENU ITEMS (organizzati per moduli progetto MTK) ===
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildMenuItem(
                    context,
                    icona: Icons.home_rounded,
                    titolo: 'Home',
                    rotta: AppRoutes.home,
                  ),
                  const Divider(),
                  _buildSectionLabel('Moduli Principali'),
                  // Modulo A
                  _buildMenuItem(
                    context,
                    icona: Icons.newspaper_rounded,
                    titolo: 'News e Avvisi',
                    rotta: AppRoutes.newsAvvisi,
                  ),
                  // Modulo B
                  _buildMenuItem(
                    context,
                    icona: Icons.groups_rounded,
                    titolo: 'Consiglio Comunale',
                    rotta: AppRoutes.consiglioComunale,
                  ),
                  // Modulo C
                  _buildMenuItem(
                    context,
                    icona: Icons.event_rounded,
                    titolo: 'Eventi e Manifestazioni',
                    rotta: AppRoutes.eventi,
                  ),
                  // Modulo D
                  _buildMenuItem(
                    context,
                    icona: Icons.museum_rounded,
                    titolo: 'Cultura e Turismo',
                    rotta: AppRoutes.culturaTurismo,
                  ),
                  // Modulo E
                  _buildMenuItem(
                    context,
                    icona: Icons.payment_rounded,
                    titolo: 'Tributi e Pagamenti',
                    rotta: AppRoutes.tributiPagamenti,
                  ),
                  const Divider(),
                  _buildSectionLabel('Servizi al Cittadino'),
                  _buildMenuItem(
                    context,
                    icona: Icons.warning_amber_rounded,
                    titolo: 'Segnala Disservizio',
                    rotta: AppRoutes.segnalaDisservizio,
                  ),
                  _buildMenuItem(
                    context,
                    icona: Icons.business_rounded,
                    titolo: 'Prenota Ufficio',
                    rotta: AppRoutes.prenotaUfficio,
                  ),
                  _buildMenuItem(
                    context,
                    icona: Icons.headset_mic_rounded,
                    titolo: 'Contatta Uffici',
                    rotta: AppRoutes.contattaUffici,
                  ),
                  _buildMenuItem(
                    context,
                    icona: Icons.delete_outline_rounded,
                    titolo: 'Gestione Rifiuti',
                    rotta: AppRoutes.gestioneRifiuti,
                  ),
                  _buildMenuItem(
                    context,
                    icona: Icons.language_rounded,
                    titolo: 'Servizi Online',
                    rotta: AppRoutes.serviziOnline,
                  ),
                  _buildMenuItem(
                    context,
                    icona: Icons.place_rounded,
                    titolo: 'Luoghi di Interesse',
                    rotta: AppRoutes.luoghiInteresse,
                  ),
                ],
              ),
            ),

            // === FOOTER ===
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  /// Header del drawer con logo e nome comune
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      decoration: const BoxDecoration(
        gradient: AppColors.headerGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo placeholder
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: const Icon(
              Icons.account_balance_rounded,
              color: AppColors.primary,
              size: 32,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            AppConstants.comuneNome,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const Text(
            AppConstants.comuneCitta,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  /// Singola voce di menu
  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icona,
    required String titolo,
    required String rotta,
  }) {
    return ListTile(
      leading: Icon(icona, color: AppColors.primary, size: 24),
      title: Text(titolo, style: AppTextStyles.bodyMedium),
      horizontalTitleGap: 8,
      onTap: () {
        Navigator.of(context).pop(); // Chiudi drawer
        // Usa pushNamedAndRemoveUntil per evitare stack infinito
        // Se la rotta è Home, torna alla root
        if (rotta == '/') {
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        } else {
          Navigator.of(context).pushNamed(rotta);
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  /// Etichetta sezione nel menu
  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 4),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyles.bodySmall.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  /// Footer con info app
  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Text(
        '© 2026 ${AppConstants.comuneNomeCompleto}',
        style: AppTextStyles.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
