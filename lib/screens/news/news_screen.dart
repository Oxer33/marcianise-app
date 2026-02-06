import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../widgets/news_card.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../data/mock_data.dart';
import 'widgets/notizia_form_dialog.dart';

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
        onPressed: () => NotiziaFormDialog.mostraFormCreaNotizia(context),
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

  // Form crea notizia (1.1) estratto in widgets/notizia_form_dialog.dart
}
