import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
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
        return _buildRoute(
          screen: const HomeScreen(),
          settings: settings,
        );

      // === MODULO A: Comunicazioni ===
      case AppRoutes.newsAvvisi:
        return _buildRoute(
          screen: const NewsScreen(),
          settings: settings,
        );

      // === MODULO B: Consiglio ===
      case AppRoutes.consiglioComunale:
        return _buildRoute(
          screen: const ConsiglioScreen(),
          settings: settings,
        );

      // === MODULO C: Eventi ===
      case AppRoutes.eventi:
        return _buildRoute(
          screen: const EventiScreen(),
          settings: settings,
        );

      // === MODULO D: Cultura e Turismo ===
      case AppRoutes.culturaTurismo:
        return _buildRoute(
          screen: const CulturaTurismoScreen(),
          settings: settings,
        );

      // === MODULO E: Tributi e Pagamenti ===
      case AppRoutes.tributiPagamenti:
        return _buildRoute(
          screen: const TributiPagamentiScreen(),
          settings: settings,
        );

      // === SEZIONE 4: Comunicazioni Sindaco ===
      case AppRoutes.comunicazioniSindaco:
        return _buildRoute(
          screen: const ComunicazioniSindacoScreen(),
          settings: settings,
        );

      // === SEZIONE 5: Servizi Scolastici ===
      case AppRoutes.serviziScolastici:
        return _buildRoute(
          screen: const ServiziScolasticiScreen(),
          settings: settings,
        );

      // === SERVIZI AL CITTADINO ===
      case AppRoutes.segnalaDisservizio:
        return _buildRoute(
          screen: const SegnalaDisservizioScreen(),
          settings: settings,
        );

      case AppRoutes.prenotaUfficio:
        return _buildRoute(
          screen: const PrenotaUfficioScreen(),
          settings: settings,
        );

      case AppRoutes.contattaUffici:
        return _buildRoute(
          screen: const ContattaUfficiScreen(),
          settings: settings,
        );

      case AppRoutes.gestioneRifiuti:
        return _buildRoute(
          screen: const GestioneRifiutiScreen(),
          settings: settings,
        );

      case AppRoutes.serviziOnline:
        return _buildRoute(
          screen: const ServiziOnlineScreen(),
          settings: settings,
        );

      case AppRoutes.luoghiInteresse:
        return _buildRoute(
          screen: const LuoghiInteresseScreen(),
          settings: settings,
        );

      default:
        return _buildRoute(
          screen: const HomeScreen(),
          settings: settings,
        );
    }
  }

  /// Costruisce una PageRouteBuilder con transizione fade/slide/scale
  static PageRouteBuilder _buildRoute({
    required Widget screen,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: AppConstants.animationNormal,
      reverseTransitionDuration: AppConstants.animationFast,
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );
        final slide = Tween<Offset>(
          begin: const Offset(0, 0.06),
          end: Offset.zero,
        ).animate(curved);
        final scale = Tween<double>(begin: 0.98, end: 1).animate(curved);

        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: slide,
            child: ScaleTransition(
              scale: scale,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
