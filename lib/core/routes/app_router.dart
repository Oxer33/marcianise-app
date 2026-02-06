import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/news/news_screen.dart';
import '../../screens/consiglio/consiglio_screen.dart';
import '../../screens/eventi/eventi_screen.dart';
import '../../screens/cultura/cultura_turismo_screen.dart';
import '../../screens/tributi/tributi_pagamenti_screen.dart';
import '../../screens/servizi/segnala_disservizio_screen.dart';
import '../../screens/servizi/prenota_ufficio_screen.dart';
import '../../screens/servizi/contatta_uffici_screen.dart';
import '../../screens/servizi/gestione_rifiuti_screen.dart';
import '../../screens/servizi/servizi_online_screen.dart';
import '../../screens/servizi/luoghi_interesse_screen.dart';
import '../../screens/sindaco/comunicazioni_sindaco_screen.dart';
import '../../screens/scolastici/servizi_scolastici_screen.dart';

/// Router centrale dell'app
/// Gestisce la navigazione tra tutte le schermate
/// Organizzato per moduli come da documento progetto MTK
class AppRouter {
  AppRouter._();

  /// Genera la rotta corretta in base al nome
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // === HOME ===
      case AppRoutes.home:
        return _buildRoute(const HomeScreen());

      // === MODULO A: Comunicazioni ===
      case AppRoutes.newsAvvisi:
        return _buildRoute(const NewsScreen());

      // === MODULO B: Consiglio ===
      case AppRoutes.consiglioComunale:
        return _buildRoute(const ConsiglioScreen());

      // === MODULO C: Eventi ===
      case AppRoutes.eventi:
        return _buildRoute(const EventiScreen());

      // === MODULO D: Cultura e Turismo ===
      case AppRoutes.culturaTurismo:
        return _buildRoute(const CulturaTurismoScreen());

      // === MODULO E: Tributi e Pagamenti ===
      case AppRoutes.tributiPagamenti:
        return _buildRoute(const TributiPagamentiScreen());

      // === SEZIONE 4: Comunicazioni Sindaco ===
      case AppRoutes.comunicazioniSindaco:
        return _buildRoute(const ComunicazioniSindacoScreen());

      // === SEZIONE 5: Servizi Scolastici ===
      case AppRoutes.serviziScolastici:
        return _buildRoute(const ServiziScolasticiScreen());

      // === SERVIZI AL CITTADINO ===
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
