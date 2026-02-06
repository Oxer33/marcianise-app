import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/news/news_screen.dart';
import '../../screens/consiglio/consiglio_screen.dart';
import '../../screens/eventi/eventi_screen.dart';
import '../../screens/servizi/segnala_disservizio_screen.dart';
import '../../screens/servizi/prenota_ufficio_screen.dart';
import '../../screens/servizi/contatta_uffici_screen.dart';
import '../../screens/servizi/gestione_rifiuti_screen.dart';
import '../../screens/servizi/servizi_online_screen.dart';
import '../../screens/servizi/luoghi_interesse_screen.dart';

/// Router centrale dell'app
/// Gestisce la navigazione tra tutte le schermate
class AppRouter {
  AppRouter._();

  /// Genera la rotta corretta in base al nome
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _buildRoute(const HomeScreen());

      case AppRoutes.newsAvvisi:
        return _buildRoute(const NewsScreen());

      case AppRoutes.consiglioComunale:
        return _buildRoute(const ConsiglioScreen());

      case AppRoutes.eventi:
        return _buildRoute(const EventiScreen());

      case AppRoutes.segnalaDisservizio:
        return _buildRoute(const SegnalaDisservizioScreen());

      case AppRoutes.prenotaUfficio:
        return _buildRoute(const PrenotaUfficioScreen());

      case AppRoutes.contattaUffici:
        return _buildRoute(const ContattaUfficiScreen());

      case AppRoutes.gestioneRifiuti:
        return _buildRoute(const GestioneRifiutiScreen());

      case AppRoutes.serviziOnline:
        return _buildRoute(const ServiziOnlineScreen());

      case AppRoutes.luoghiInteresse:
        return _buildRoute(const LuoghiInteresseScreen());

      default:
        return _buildRoute(const HomeScreen());
    }
  }

  /// Costruisce una MaterialPageRoute con animazione standard
  static MaterialPageRoute _buildRoute(Widget screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }
}
