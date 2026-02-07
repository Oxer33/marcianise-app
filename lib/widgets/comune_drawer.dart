import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/constants/app_constants.dart';
import '../core/routes/app_routes.dart';
import '../core/utils/localization_extension.dart';

/// Drawer laterale (menu hamburger) dell'app
/// Mostra tutte le sezioni navigabili dell'applicazione
class ComuneDrawer extends StatelessWidget {
  const ComuneDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Column(
          children: [
            // === HEADER DRAWER ===
            _buildHeader(context),
            const Divider(height: 1),

            // === MENU ITEMS (organizzati per moduli progetto MTK) ===
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildMenuItem(
                    context,
                    icona: Icons.home_rounded,
                    titolo: context.l10n.navHome,
                    rotta: AppRoutes.home,
                  ),
                  const Divider(),
                  _buildSectionLabel(context.l10n.drawerSectionMain),
                  // Modulo A
                  _buildMenuItem(
                    context,
                    icona: Icons.newspaper_rounded,
                    titolo: context.l10n.navNews,
                    rotta: AppRoutes.newsAvvisi,
                  ),
                  // Modulo B
                  _buildMenuItem(
                    context,
                    icona: Icons.groups_rounded,
                    titolo: context.l10n.navConsiglio,
                    rotta: AppRoutes.consiglioComunale,
                  ),
                  // Modulo C
                  _buildMenuItem(
                    context,
                    icona: Icons.event_rounded,
                    titolo: context.l10n.navEventiManifestazioni,
                    rotta: AppRoutes.eventi,
                  ),
                  // Modulo D
                  _buildMenuItem(
                    context,
                    icona: Icons.museum_rounded,
                    titolo: context.l10n.navCultura,
                    rotta: AppRoutes.culturaTurismo,
                  ),
                  // Modulo E
                  _buildMenuItem(
                    context,
                    icona: Icons.payment_rounded,
                    titolo: context.l10n.navTributi,
                    rotta: AppRoutes.tributiPagamenti,
                  ),
                  const Divider(),
                  _buildSectionLabel(context.l10n.drawerSectionStructure),
                  // Sezione 4 - Comunicazioni Sindaco
                  _buildMenuItem(
                    context,
                    icona: Icons.record_voice_over_rounded,
                    titolo: context.l10n.navComunicazioniSindaco,
                    rotta: AppRoutes.comunicazioniSindaco,
                  ),
                  // Sezione 5 - Servizi Scolastici
                  _buildMenuItem(
                    context,
                    icona: Icons.school_rounded,
                    titolo: context.l10n.navServiziScolastici,
                    rotta: AppRoutes.serviziScolastici,
                  ),
                  const Divider(),
                  _buildSectionLabel(context.l10n.drawerSectionServices),
                  _buildMenuItem(
                    context,
                    icona: Icons.warning_amber_rounded,
                    titolo: context.l10n.navSegnalaDisservizio,
                    rotta: AppRoutes.segnalaDisservizio,
                  ),
                  _buildMenuItem(
                    context,
                    icona: Icons.business_rounded,
                    titolo: context.l10n.navPrenotaUfficio,
                    rotta: AppRoutes.prenotaUfficio,
                  ),
                  _buildMenuItem(
                    context,
                    icona: Icons.headset_mic_rounded,
                    titolo: context.l10n.navContattaUffici,
                    rotta: AppRoutes.contattaUffici,
                  ),
                  _buildMenuItem(
                    context,
                    icona: Icons.delete_outline_rounded,
                    titolo: context.l10n.navGestioneRifiuti,
                    rotta: AppRoutes.gestioneRifiuti,
                  ),
                  _buildMenuItem(
                    context,
                    icona: Icons.language_rounded,
                    titolo: context.l10n.navServiziOnline,
                    rotta: AppRoutes.serviziOnline,
                  ),
                  _buildMenuItem(
                    context,
                    icona: Icons.place_rounded,
                    titolo: context.l10n.navLuoghiInteresse,
                    rotta: AppRoutes.luoghiInteresse,
                  ),
                ],
              ),
            ),

            // === FOOTER ===
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  /// Header del drawer con logo e nome comune
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      decoration: const BoxDecoration(
        gradient: AppColors.headerGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo ufficiale del comune (stemma)
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.textOnPrimary,
              border: Border.all(color: AppColors.textOnPrimary, width: 3),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/stemma_marcianise.png',
                fit: BoxFit.cover,
                width: 54,
                height: 54,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.account_balance_rounded,
                    color: AppColors.primary,
                    size: 32,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            context.l10n.homeTitleComune,
            style: TextStyle(
              color: AppColors.textOnPrimary.withValues(alpha: 0.7),
              fontSize: 14,
            ),
          ),
          Text(
            context.l10n.homeSubtitleCity,
            style: const TextStyle(
              color: AppColors.textOnPrimary,
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

  /// Footer con info app, contatti e social del comune
  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.textSecondary.withValues(alpha: 0.2)),
        ),
      ),
      child: Column(
        children: [
          // Info sede
          Text(
            AppConstants.indirizzoCompleto,
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            context.l10n.drawerFooterPhone(AppConstants.telefono),
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          // Copyright
          Text(
            context.l10n.drawerFooterCopyright(
              DateTime.now().year,
              AppConstants.comuneNomeCompleto,
            ),
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
