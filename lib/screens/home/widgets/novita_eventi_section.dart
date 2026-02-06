import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/mock_data.dart';
import '../../../widgets/news_card.dart';
import '../../../widgets/evento_card.dart';

/// Sezione in basso nella home con tab Novità / Eventi
/// Mostra le ultime news e gli eventi in arrivo
class NovitaEventiSection extends StatefulWidget {
  const NovitaEventiSection({super.key});

  @override
  State<NovitaEventiSection> createState() => _NovitaEventiSectionState();
}

class _NovitaEventiSectionState extends State<NovitaEventiSection>
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMedium,
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),

          // === TAB BAR Novità / Eventi ===
          Container(
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
                Tab(text: 'Novità'),
                Tab(text: 'Eventi'),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // === CONTENUTO TAB ===
          SizedBox(
            // Altezza fissa per evitare layout jump
            height: 350,
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab Novità
                _buildNovitaTab(),
                // Tab Eventi
                _buildEventiTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Tab con le ultime novità
  Widget _buildNovitaTab() {
    final news = MockData.news;

    return Column(
      children: [
        // Lista news
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: news.length > 3 ? 3 : news.length,
            itemBuilder: (context, index) {
              return NewsCard(news: news[index]);
            },
          ),
        ),
        // Pulsante "Vedi tutte"
        _buildVediTuttoButton(
          'Vedi tutte le novità',
          AppRoutes.newsAvvisi,
        ),
      ],
    );
  }

  /// Tab con gli eventi in arrivo
  Widget _buildEventiTab() {
    final eventi = MockData.eventi;

    return Column(
      children: [
        // Lista eventi
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: eventi.length > 3 ? 3 : eventi.length,
            itemBuilder: (context, index) {
              return EventoCard(evento: eventi[index]);
            },
          ),
        ),
        // Pulsante "Vedi tutti"
        _buildVediTuttoButton(
          'Vedi tutti gli eventi',
          AppRoutes.eventi,
        ),
      ],
    );
  }

  /// Pulsante "Vedi tutto" per navigare alla lista completa
  Widget _buildVediTuttoButton(String testo, String rotta) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextButton(
        onPressed: () => Navigator.of(context).pushNamed(rotta),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              testo,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
