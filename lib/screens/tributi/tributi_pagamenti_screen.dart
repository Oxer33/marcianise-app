import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';

/// Modulo E - Tributi e Pagamenti
/// Gestione economica dei servizi comunali tramite PagoPA
/// Include: visualizzazione scadenze, storico pagamenti, simulatore costi
class TributiPagamentiScreen extends StatelessWidget {
  const TributiPagamentiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ComuneAppBar(
        titolo: 'Tributi e Pagamenti',
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === HEADER SEZIONE ===
            const Text('I tuoi pagamenti', style: AppTextStyles.heading1),
            const SizedBox(height: 8),
            Text(
              'Consulta le scadenze, effettua pagamenti e visualizza lo storico delle transazioni.',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),

            // === ACCESSO RAPIDO PAGOPA ===
            _buildPagopaCard(context),
            const SizedBox(height: 20),

            // === TRIBUTI DISPONIBILI ===
            const Text('Tributi comunali', style: AppTextStyles.heading2),
            const SizedBox(height: 12),

            _buildTributoCard(
              icona: Icons.home_rounded,
              titolo: 'IMU - Imposta Municipale',
              scadenza: 'Scadenza: 16 Giugno 2026',
              importo: '€ ---',
              stato: 'In attesa',
            ),
            _buildTributoCard(
              icona: Icons.delete_outline_rounded,
              titolo: 'TARI - Tassa Rifiuti',
              scadenza: 'Scadenza: 30 Aprile 2026',
              importo: '€ ---',
              stato: 'In attesa',
            ),
            _buildTributoCard(
              icona: Icons.water_drop_rounded,
              titolo: 'Canone Idrico',
              scadenza: 'Scadenza: 31 Marzo 2026',
              importo: '€ ---',
              stato: 'In attesa',
            ),
            _buildTributoCard(
              icona: Icons.school_rounded,
              titolo: 'Servizi Scolastici',
              scadenza: 'Mensa, trasporto, pre/post scuola',
              importo: '€ ---',
              stato: 'In attesa',
            ),

            const SizedBox(height: 20),

            // === STORICO PAGAMENTI ===
            const Text('Storico pagamenti', style: AppTextStyles.heading2),
            const SizedBox(height: 12),

            _buildStoricoPagamento(
              titolo: 'TARI 2025 - Rata unica',
              data: '15 Dic 2025',
              importo: '€ 280,00',
              stato: 'Pagato',
            ),
            _buildStoricoPagamento(
              titolo: 'IMU 2025 - Saldo',
              data: '16 Dic 2025',
              importo: '€ 450,00',
              stato: 'Pagato',
            ),

            const SizedBox(height: 16),

            // === NOTA PagoPA ===
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardService4.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.info.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline_rounded, color: AppColors.info, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'I pagamenti sono gestiti tramite la piattaforma PagoPA in conformità con le normative nazionali.',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Card principale PagoPA con accesso rapido
  Widget _buildPagopaCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primaryDark,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo PagoPA placeholder
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'pagoPA',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const Spacer(),
              Icon(Icons.security_rounded, color: Colors.white.withValues(alpha: 0.7), size: 24),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Paga online in sicurezza',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Effettua pagamenti di tributi, multe e servizi comunali tramite la piattaforma certificata PagoPA.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          // Bottone Paga
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Integrazione PagoPA
              SnackBarHelper.showInfo(context, 'Integrazione PagoPA in arrivo...');
            },
            icon: const Icon(Icons.payment_rounded),
            label: const Text('Vai a PagoPA'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primary,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  /// Card singolo tributo
  Widget _buildTributoCard({
    required IconData icona,
    required String titolo,
    required String scadenza,
    required String importo,
    required String stato,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          // Icona
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.cardService5,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icona, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: 12),
          // Info tributo
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titolo, style: AppTextStyles.heading3.copyWith(fontSize: 14)),
                const SizedBox(height: 2),
                Text(
                  scadenza,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Importo e stato
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                importo,
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.primary,
                  fontSize: 14,
                ),
              ),
              Text(
                stato,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.warning,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Riga storico pagamento
  Widget _buildStoricoPagamento({
    required String titolo,
    required String data,
    required String importo,
    required String stato,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle_rounded, color: AppColors.success, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titolo, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w500)),
                Text(data, style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
          Text(
            importo,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.success,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
