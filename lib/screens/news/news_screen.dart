import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../widgets/news_card.dart';
import '../../widgets/skeleton_news_card.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../data/mock_data.dart';
import 'widgets/notizia_form_dialog.dart';
import '../../core/utils/localization_extension.dart';

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
  bool _isRefreshing = false;

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

  /// Gestisce il pull-to-refresh simulando un caricamento breve.
  Future<void> _handleRefresh() async {
    setState(() => _isRefreshing = true);
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() => _isRefreshing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComuneAppBar(
        titolo: context.l10n.screenNewsTitle,
        mostraBack: true,
      ),
      drawer: const ComuneDrawer(),
      // 1.1 - FAB per creare nuova notizia
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => NotiziaFormDialog.mostraFormCreaNotizia(context),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_rounded, color: AppColors.textOnPrimary),
        label: Text(
          context.l10n.actionCreaNotizia,
          style: const TextStyle(color: AppColors.textOnPrimary),
        ),
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
                  label: Text(context.l10n.actionStatistiche),
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
                labelColor: AppColors.textOnPrimary,
                unselectedLabelColor: AppColors.primary,
                labelStyle: AppTextStyles.tabLabel,
                unselectedLabelStyle: AppTextStyles.tabLabel,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: context.l10n.newsTabNews),
                  Tab(text: context.l10n.newsTabAvvisi),
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

    const physics = AlwaysScrollableScrollPhysics(
      parent: BouncingScrollPhysics(),
    );

    if (_isRefreshing) {
      return _buildRefreshWrapper(
        ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingMedium,
          ),
          physics: physics,
          itemCount: 3,
          itemBuilder: (context, index) {
            return const SkeletonNewsCard();
          },
        ),
      );
    }

    if (filtrate.isEmpty) {
      return _buildRefreshWrapper(
        ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingMedium,
          ),
          physics: physics,
          children: [
            const SizedBox(height: 80),
            _buildEmptyState(),
            const SizedBox(height: 80),
          ],
        ),
      );
    }

    return _buildRefreshWrapper(
      ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingMedium,
        ),
        physics: physics,
        itemCount: filtrate.length,
        itemBuilder: (context, index) {
          return NewsCard(news: filtrate[index]);
        },
      ),
    );
  }

  /// Wrapper riutilizzabile per il RefreshIndicator.
  Widget _buildRefreshWrapper(Widget child) {
    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: _handleRefresh,
      child: child,
    );
  }

  /// Stato vuoto con stile coerente.
  Widget _buildEmptyState() {
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
            context.l10n.emptyGeneric,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
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
          _buildStatItem('$totaleNews', context.l10n.statsNews),
          _buildStatDivider(),
          _buildStatItem('$totaleAvvisi', context.l10n.statsAvvisi),
          _buildStatDivider(),
          _buildStatItem('$urgenti', context.l10n.statsUrgenti),
          _buildStatDivider(),
          _buildStatItem('${totaleNews + totaleAvvisi}', context.l10n.statsTotale),
        ],
      ),
    );
  }

  Widget _buildStatItem(String valore, String label) {
    return Column(
      children: [
        Text(
          valore,
          style: const TextStyle(
            color: AppColors.textOnPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: AppColors.textOnPrimary.withValues(alpha: 0.7),
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(
      width: 1,
      height: 30,
      color: AppColors.textOnPrimary.withValues(alpha: 0.3),
    );
  }

  /// 1.2.1 - Dialog statistiche dettagliate
  void _mostraStatisticheDettaglio(BuildContext context) {
    final totaleNews = MockData.news.where((n) => n.categoria == 'news').length;
    final totaleAvvisi = MockData.news.where((n) => n.categoria == 'avviso').length;
    final urgenti = MockData.news.where((n) => n.isUrgente).length;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.newsStatsDialogTitle, style: AppTextStyles.heading2),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStatRow(context.l10n.newsStatsPublished, '$totaleNews', Icons.newspaper_rounded),
            _buildStatRow(context.l10n.newsStatsAvvisi, '$totaleAvvisi', Icons.warning_amber_rounded),
            _buildStatRow(context.l10n.statsUrgenti, '$urgenti', Icons.priority_high_rounded),
            _buildStatRow(context.l10n.statsTotale, '${totaleNews + totaleAvvisi}', Icons.summarize_rounded),
            const Divider(),
            Text(
              context.l10n.newsStatsFooter,
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(context.l10n.actionClose),
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
