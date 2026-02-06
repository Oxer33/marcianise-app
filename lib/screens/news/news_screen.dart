import 'package:flutter/material.dart';
import '../../widgets/comune_app_bar.dart';
import '../../widgets/comune_drawer.dart';
import '../../widgets/news_card.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../data/mock_data.dart';

/// Modulo A - Comunicazioni istituzionali e Notizie
/// Mostra tutte le notizie e avvisi del comune
/// Con filtro per categoria (News / Avvisi) e filtro data
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
      body: Column(
        children: [
          // === FILTRO DATA ===
          Padding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // TODO: Implementare filtro data
                  },
                  icon: const Icon(Icons.filter_alt_outlined, size: 18),
                  label: const Text('Filtra per data'),
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
}
