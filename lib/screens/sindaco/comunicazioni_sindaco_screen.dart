import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import 'widgets/sindaco_form_dialogs.dart';

/// Sezione 4 - Comunicazioni del Sindaco
/// Struttura richiesta:
/// 4.1. Carica immagini
/// 4.2. Carica video
/// 4.3. Inserisci Comunicati
class ComunicazioniSindacoScreen extends StatelessWidget {
  const ComunicazioniSindacoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ComuneAppBar(
        titolo: 'Comunicazioni Sindaco',
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === HEADER ===
            _buildHeader(),
            const SizedBox(height: 24),

            // === 4.1 CARICA IMMAGINI ===
            _buildSezioneCard(
              context,
              icona: Icons.photo_library_rounded,
              titolo: '4.1 Carica Immagini',
              descrizione: 'Galleria fotografica del sindaco: eventi istituzionali, inaugurazioni e visite.',
              colore: const Color(0xFF1565C0),
              onTap: () => SindacoFormDialogs.mostraFormImmagini(context),
            ),
            const SizedBox(height: 16),

            // === 4.2 CARICA VIDEO ===
            _buildSezioneCard(
              context,
              icona: Icons.videocam_rounded,
              titolo: '4.2 Carica Video',
              descrizione: 'Videomessaggi e dichiarazioni ufficiali del sindaco alla cittadinanza.',
              colore: const Color(0xFFC62828),
              onTap: () => SindacoFormDialogs.mostraFormVideo(context),
            ),
            const SizedBox(height: 16),

            // === 4.3 INSERISCI COMUNICATI ===
            _buildSezioneCard(
              context,
              icona: Icons.article_rounded,
              titolo: '4.3 Inserisci Comunicati',
              descrizione: 'Comunicati stampa ufficiali, ordinanze e avvisi del sindaco.',
              colore: AppColors.primary,
              onTap: () => SindacoFormDialogs.mostraFormComunicati(context),
            ),
            const SizedBox(height: 24),

            // === ULTIMI COMUNICATI ===
            const Text('Ultimi Comunicati', style: AppTextStyles.heading2),
            const SizedBox(height: 12),
            _buildComunicatoCard(
              context,
              'Ordinanza pulizia straordinaria centro storico',
              '5 Febbraio 2026',
              'Il sindaco ordina interventi di pulizia straordinaria nel centro storico a partire dal 10 febbraio.',
              Icons.gavel_rounded,
            ),
            _buildComunicatoCard(
              context,
              'Auguri di buon anno alla cittadinanza',
              '1 Gennaio 2026',
              'Cari concittadini, è con grande piacere che vi porgo i miei auguri per un sereno e prospero anno nuovo.',
              Icons.celebration_rounded,
            ),
            _buildComunicatoCard(
              context,
              'Aggiornamento lavori pubblici Via Roma',
              '20 Dicembre 2025',
              'Vi informo che i lavori di riqualificazione di Via Roma procedono secondo i tempi previsti.',
              Icons.construction_rounded,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  /// Header con icona e descrizione della sezione
  Widget _buildHeader() {
    return Column(
      children: [
        // Icona sindaco
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.record_voice_over_rounded,
            color: AppColors.primary,
            size: 40,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Comunicazioni del Sindaco',
          style: AppTextStyles.heading2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Immagini, video e comunicati ufficiali del Sindaco di Marcianise.',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Card per ogni sotto-sezione (4.1, 4.2, 4.3)
  Widget _buildSezioneCard(
    BuildContext context, {
    required IconData icona,
    required String titolo,
    required String descrizione,
    required Color colore,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icona colorata
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: colore.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icona, color: colore, size: 28),
            ),
            const SizedBox(width: 16),
            // Testo
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titolo, style: AppTextStyles.heading3),
                  const SizedBox(height: 4),
                  Text(
                    descrizione,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            // Freccia
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  /// Card per un comunicato nella lista (con modifica/elimina)
  Widget _buildComunicatoCard(
    BuildContext context,
    String titolo,
    String data,
    String contenuto,
    IconData icona,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Riga icona + titolo + menu modifica/elimina
          Row(
            children: [
              Icon(icona, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(titolo, style: AppTextStyles.heading3),
              ),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert_rounded, color: AppColors.textSecondary, size: 18),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onSelected: (value) {
                  if (value == 'modifica') {
                    SnackBarHelper.showInfo(context, 'Modifica "$titolo" - collegare al back office');
                  } else if (value == 'elimina') {
                    SnackBarHelper.showWarning(context, 'Eliminazione "$titolo" - collegare al back office');
                  }
                },
                itemBuilder: (ctx) => [
                  const PopupMenuItem(
                    value: 'modifica',
                    child: Row(
                      children: [
                        Icon(Icons.edit_rounded, size: 20),
                        SizedBox(width: 8),
                        Text('Modifica'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'elimina',
                    child: Row(
                      children: [
                        Icon(Icons.delete_rounded, size: 20, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Elimina', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            data,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            contenuto,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Form dialogs (4.1, 4.2, 4.3) estratti in widgets/sindaco_form_dialogs.dart
}
