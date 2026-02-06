import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';

/// Schermata servizi online del comune
/// Mostra i link ai servizi digitali disponibili
class ServiziOnlineScreen extends StatelessWidget {
  const ServiziOnlineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ComuneAppBar(
        titolo: 'Servizi Online',
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: 24),

            // Lista servizi online (link reali dal sito comune.marcianise.ce.it)
            _buildServizioOnlineCard(
              context,
              'ANPR - Sportello del Cittadino',
              'Anagrafe Nazionale Popolazione Residente: certificati, cambio residenza.',
              Icons.badge_rounded,
              AppColors.primary,
            ),
            _buildServizioOnlineCard(
              context,
              'Pagamenti Online (PagoPA)',
              'Paga tributi, IMU, TARI, multe e servizi comunali online.',
              Icons.payment_rounded,
              const Color(0xFF43A047),
            ),
            _buildServizioOnlineCard(
              context,
              'Sportello Telematico IMU e TARI',
              'Dichiarazioni, calcolo e gestione IMU e TARI online.',
              Icons.receipt_long_rounded,
              const Color(0xFFE65100),
            ),
            _buildServizioOnlineCard(
              context,
              'SUAP - Attività Produttive',
              'Sportello Unico Attività Produttive su impresainungiorno.gov.it.',
              Icons.store_rounded,
              const Color(0xFF6A1B9A),
            ),
            _buildServizioOnlineCard(
              context,
              'SUE - Sportello Unico Edilizia',
              'Pratiche edilizie e urbanistiche tramite sportello telematico.',
              Icons.apartment_rounded,
              const Color(0xFF00838F),
            ),
            _buildServizioOnlineCard(
              context,
              'Albo Pretorio Online',
              'Consulta atti, determine, delibere e ordinanze pubblicate.',
              Icons.gavel_rounded,
              const Color(0xFF795548),
            ),
            _buildServizioOnlineCard(
              context,
              'Amministrazione Trasparente',
              'Accesso agli atti e alle informazioni sulla PA.',
              Icons.visibility_rounded,
              const Color(0xFF546E7A),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  /// Header con icona e descrizione
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.cardService5,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFF00838F).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.language_rounded,
              color: Color(0xFF00838F),
              size: 40,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Servizi Online',
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Accedi ai servizi digitali del comune comodamente da casa.',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Card singolo servizio online con feedback al tap
  Widget _buildServizioOnlineCard(
    BuildContext context,
    String titolo,
    String descrizione,
    IconData icona,
    Color colore,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colore.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icona, color: colore, size: 24),
        ),
        title: Text(titolo, style: AppTextStyles.heading3),
        subtitle: Text(
          descrizione,
          style: AppTextStyles.bodySmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(
          Icons.open_in_new_rounded,
          size: 18,
          color: AppColors.textSecondary,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {
          // TODO: Aprire il servizio online con url_launcher
          SnackBarHelper.showInfo(context, 'Apertura "$titolo" - integrazione browser in arrivo!');
        },
      ),
    );
  }
}
