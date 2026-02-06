import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../widgets/news_card.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../data/mock_data.dart';

/// Sezione 1 - Notizie (struttura richiesta)
/// 1.1. Crea Notizie (titolo, contenuto, criticità + notifica)
/// 1.2. Visualizza Notizie + 1.2.1. Statistiche
/// 1.3. Modifica/elimina Notizie
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ComuneAppBar(
        titolo: 'News e Avvisi',
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      // 1.1 - FAB per creare nuova notizia
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _mostraFormCreaNotizia(context),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: const Text('Crea Notizia', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // === 1.2.1 STATISTICHE NOTIZIE ===
          _buildStatistiche(),

          // === FILTRO DATA ===
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () => _mostraStatisticheDettaglio(context),
                  icon: const Icon(Icons.bar_chart_rounded, size: 18),
                  label: const Text('Statistiche'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),

          // === TAB BAR News / Avvisi ===
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.cardService1,
                borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: AppColors.primary,
                labelStyle: AppTextStyles.tabLabel,
                unselectedLabelStyle: AppTextStyles.tabLabel,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: 'News'),
                  Tab(text: 'Avvisi'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // === LISTA NEWS/AVVISI ===
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab News
                _buildNewsList('news'),
                // Tab Avvisi
                _buildNewsList('avviso'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Costruisce la lista filtrata per categoria
  Widget _buildNewsList(String categoria) {
    final filtrate = MockData.news
        .where((n) => n.categoria == categoria)
        .toList();

    if (filtrate.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_rounded,
              size: 64,
              color: AppColors.textSecondary.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'Nessun elemento trovato',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMedium,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: filtrate.length,
      itemBuilder: (context, index) {
        return NewsCard(news: filtrate[index]);
      },
    );
  }

  /// 1.2.1 - Widget statistiche notizie compatto
  Widget _buildStatistiche() {
    final totaleNews = MockData.news.where((n) => n.categoria == 'news').length;
    final totaleAvvisi = MockData.news.where((n) => n.categoria == 'avviso').length;
    final urgenti = MockData.news.where((n) => n.isUrgente).length;

    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppConstants.paddingMedium, AppConstants.paddingMedium,
        AppConstants.paddingMedium, 0,
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('$totaleNews', 'News'),
          _buildStatDivider(),
          _buildStatItem('$totaleAvvisi', 'Avvisi'),
          _buildStatDivider(),
          _buildStatItem('$urgenti', 'Urgenti'),
          _buildStatDivider(),
          _buildStatItem('${totaleNews + totaleAvvisi}', 'Totale'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String valore, String label) {
    return Column(
      children: [
        Text(valore, style: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,
        )),
        Text(label, style: const TextStyle(
          color: Colors.white70, fontSize: 11,
        )),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(width: 1, height: 30, color: Colors.white30);
  }

  /// 1.2.1 - Dialog statistiche dettagliate
  void _mostraStatisticheDettaglio(BuildContext context) {
    final totaleNews = MockData.news.where((n) => n.categoria == 'news').length;
    final totaleAvvisi = MockData.news.where((n) => n.categoria == 'avviso').length;
    final urgenti = MockData.news.where((n) => n.isUrgente).length;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Statistiche Notizie', style: AppTextStyles.heading2),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStatRow('News pubblicate', '$totaleNews', Icons.newspaper_rounded),
            _buildStatRow('Avvisi pubblicati', '$totaleAvvisi', Icons.warning_amber_rounded),
            _buildStatRow('Urgenti', '$urgenti', Icons.priority_high_rounded),
            _buildStatRow('Totale', '${totaleNews + totaleAvvisi}', Icons.summarize_rounded),
            const Divider(),
            Text(
              'Statistiche dettagliate saranno disponibili con il back office.',
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Chiudi'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String valore, IconData icona) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icona, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: AppTextStyles.bodyMedium)),
          Text(valore, style: AppTextStyles.heading3),
        ],
      ),
    );
  }

  /// 1.1 - Form per creare nuova notizia
  /// 1.1.1. Titolo | 1.1.2. Contenuto | 1.1.3. Criticità
  void _mostraFormCreaNotizia(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Crea Notizia', style: AppTextStyles.heading2),
              const SizedBox(height: 16),
              // 1.1.1 - Titolo
              const TextField(
                decoration: InputDecoration(
                  labelText: '1.1.1 Titolo della notizia',
                  prefixIcon: Icon(Icons.title_rounded),
                ),
              ),
              const SizedBox(height: 12),
              // 1.1.2 - Contenuto
              const TextField(
                decoration: InputDecoration(
                  labelText: '1.1.2 Contenuto della notizia',
                  prefixIcon: Icon(Icons.edit_note_rounded),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 12),
              // 1.1.3 - Criticità
              const Text('1.1.3 Criticità', style: AppTextStyles.heading3),
              const SizedBox(height: 8),
              // Selettore criticità
              Row(
                children: [
                  _buildCriticitaChip('Bassa', Colors.green),
                  const SizedBox(width: 8),
                  _buildCriticitaChip('Media', Colors.orange),
                  const SizedBox(width: 8),
                  _buildCriticitaChip('Alta', Colors.red),
                ],
              ),
              const SizedBox(height: 8),
              // 1.1.3.1 - Info notifica
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.info.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.notifications_active_rounded, color: AppColors.info, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '1.1.3.1 La notifica push verrà inviata automaticamente in base alla criticità selezionata.',
                        style: AppTextStyles.bodySmall.copyWith(color: AppColors.info),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Bottone pubblica
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(ctx);
                    SnackBarHelper.showSuccess(context, 'Notizia creata (collegare al back office)');
                  },
                  icon: const Icon(Icons.publish_rounded),
                  label: const Text('Pubblica Notizia'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  /// Chip per selezionare la criticità della notizia
  Widget _buildCriticitaChip(String label, Color colore) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: colore.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colore.withValues(alpha: 0.3)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: colore,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
