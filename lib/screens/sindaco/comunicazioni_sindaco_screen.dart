import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';

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
              onTap: () => _mostraFormImmagini(context),
            ),
            const SizedBox(height: 16),

            // === 4.2 CARICA VIDEO ===
            _buildSezioneCard(
              context,
              icona: Icons.videocam_rounded,
              titolo: '4.2 Carica Video',
              descrizione: 'Videomessaggi e dichiarazioni ufficiali del sindaco alla cittadinanza.',
              colore: const Color(0xFFC62828),
              onTap: () => _mostraFormVideo(context),
            ),
            const SizedBox(height: 16),

            // === 4.3 INSERISCI COMUNICATI ===
            _buildSezioneCard(
              context,
              icona: Icons.article_rounded,
              titolo: '4.3 Inserisci Comunicati',
              descrizione: 'Comunicati stampa ufficiali, ordinanze e avvisi del sindaco.',
              colore: AppColors.primary,
              onTap: () => _mostraFormComunicati(context),
            ),
            const SizedBox(height: 24),

            // === ULTIMI COMUNICATI ===
            const Text('Ultimi Comunicati', style: AppTextStyles.heading2),
            const SizedBox(height: 12),
            _buildComunicatoCard(
              'Ordinanza pulizia straordinaria centro storico',
              '5 Febbraio 2026',
              'Il sindaco ordina interventi di pulizia straordinaria nel centro storico a partire dal 10 febbraio.',
              Icons.gavel_rounded,
            ),
            _buildComunicatoCard(
              'Auguri di buon anno alla cittadinanza',
              '1 Gennaio 2026',
              'Cari concittadini, è con grande piacere che vi porgo i miei auguri per un sereno e prospero anno nuovo.',
              Icons.celebration_rounded,
            ),
            _buildComunicatoCard(
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

  /// Card per un comunicato nella lista
  Widget _buildComunicatoCard(
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
          // Riga icona + data
          Row(
            children: [
              Icon(icona, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(titolo, style: AppTextStyles.heading3),
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

  // === FORM DIALOGS ===

  /// 4.1 - Form per caricare immagini
  void _mostraFormImmagini(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          AppConstants.paddingMedium,
          AppConstants.paddingMedium,
          AppConstants.paddingMedium,
          MediaQuery.of(ctx).viewInsets.bottom + AppConstants.paddingMedium,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Carica Immagini', style: AppTextStyles.heading2),
            const SizedBox(height: 16),
            // Area upload
            GestureDetector(
              onTap: () {
                Navigator.pop(ctx);
                SnackBarHelper.showInfo(context, 'Upload immagini sarà gestito dal back office');
              },
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primary.withValues(alpha: 0.05),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload_rounded, color: AppColors.primary, size: 40),
                    SizedBox(height: 8),
                    Text('Tocca per selezionare immagini', style: AppTextStyles.bodyMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  /// 4.2 - Form per caricare video
  void _mostraFormVideo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          AppConstants.paddingMedium,
          AppConstants.paddingMedium,
          AppConstants.paddingMedium,
          MediaQuery.of(ctx).viewInsets.bottom + AppConstants.paddingMedium,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Carica Video', style: AppTextStyles.heading2),
            const SizedBox(height: 16),
            // Area upload video
            GestureDetector(
              onTap: () {
                Navigator.pop(ctx);
                SnackBarHelper.showInfo(context, 'Upload video sarà gestito dal back office');
              },
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFC62828).withValues(alpha: 0.3),
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFC62828).withValues(alpha: 0.05),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.video_call_rounded, color: Color(0xFFC62828), size: 40),
                    SizedBox(height: 8),
                    Text('Tocca per selezionare un video', style: AppTextStyles.bodyMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  /// 4.3 - Form per inserire comunicati
  void _mostraFormComunicati(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          AppConstants.paddingMedium,
          AppConstants.paddingMedium,
          AppConstants.paddingMedium,
          MediaQuery.of(ctx).viewInsets.bottom + AppConstants.paddingMedium,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nuovo Comunicato', style: AppTextStyles.heading2),
            const SizedBox(height: 16),
            // Campo titolo
            const TextField(
              decoration: InputDecoration(
                labelText: 'Titolo del comunicato',
                prefixIcon: Icon(Icons.title_rounded),
              ),
            ),
            const SizedBox(height: 12),
            // Campo contenuto
            const TextField(
              decoration: InputDecoration(
                labelText: 'Contenuto del comunicato',
                prefixIcon: Icon(Icons.edit_note_rounded),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            // Bottone invio
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(ctx);
                  SnackBarHelper.showSuccess(context, 'Comunicato inserito (collegare al back office)');
                },
                icon: const Icon(Icons.send_rounded),
                label: const Text('Pubblica Comunicato'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
