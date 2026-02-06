import 'package:flutter/material.dart';
import '../models/servizio_model.dart';
import '../models/news_model.dart';
import '../models/evento_model.dart';
import '../models/meteo_model.dart';
import '../core/theme/app_colors.dart';
import '../core/routes/app_routes.dart';

/// Dati finti (mock) per popolare l'app durante lo sviluppo
/// In futuro verranno sostituiti da dati reali dal back office
class MockData {
  MockData._();

  // === SERVIZI GRIGLIA HOME (allineati ai 5 moduli del progetto MTK) ===
  static const List<ServizioModel> servizi = [
    // Modulo A: Comunicazioni istituzionali e Notizie
    ServizioModel(
      titolo: 'News e\nAvvisi',
      icona: Icons.newspaper_rounded,
      coloreSfondo: AppColors.cardService1,
      coloreIcona: AppColors.primary,
      rotta: AppRoutes.newsAvvisi,
    ),
    // Modulo B: Diretta live Consiglio Comunale
    ServizioModel(
      titolo: 'Consiglio\nComunale',
      icona: Icons.groups_rounded,
      coloreSfondo: AppColors.cardService2,
      coloreIcona: Color(0xFF00695C),
      rotta: AppRoutes.consiglioComunale,
    ),
    // Modulo C: Eventi e manifestazioni
    ServizioModel(
      titolo: 'Eventi e\nManifestazioni',
      icona: Icons.event_rounded,
      coloreSfondo: AppColors.cardService3,
      coloreIcona: Color(0xFFE65100),
      rotta: AppRoutes.eventi,
    ),
    // Modulo D: Cultura e Turismo
    ServizioModel(
      titolo: 'Cultura e\nTurismo',
      icona: Icons.museum_rounded,
      coloreSfondo: AppColors.cardService4,
      coloreIcona: Color(0xFF1565C0),
      rotta: AppRoutes.culturaTurismo,
    ),
    // Modulo E: Tributi e Pagamenti
    ServizioModel(
      titolo: 'Tributi e\nPagamenti',
      icona: Icons.payment_rounded,
      coloreSfondo: AppColors.cardService5,
      coloreIcona: Color(0xFFC62828),
      rotta: AppRoutes.tributiPagamenti,
    ),
    // Servizi al cittadino
    ServizioModel(
      titolo: 'Servizi al\nCittadino',
      icona: Icons.person_rounded,
      coloreSfondo: AppColors.cardService6,
      coloreIcona: Color(0xFF6A1B9A),
      rotta: AppRoutes.serviziOnline,
    ),
  ];

  // === PREVISIONI METEO ===
  static const List<MeteoGiornoModel> meteo = [
    MeteoGiornoModel(
      giorno: 'GIO',
      tempMax: 10,
      tempMin: 7,
      condizione: 'Nuvoloso',
      icona: 'cloud',
    ),
    MeteoGiornoModel(
      giorno: 'VEN',
      tempMax: 13,
      tempMin: 4,
      condizione: 'Parz. Nuvoloso',
      icona: 'cloud_sun',
    ),
    MeteoGiornoModel(
      giorno: 'SAB',
      tempMax: 12,
      tempMin: 2,
      condizione: 'Soleggiato',
      icona: 'sunny',
    ),
  ];

  // === NEWS E AVVISI (dati reali dal sito www.comune.marcianise.ce.it) ===
  static const List<NewsModel> news = [
    NewsModel(
      id: '1',
      titolo: 'Lotta agli illeciti ambientali',
      descrizione:
          'Il Commissario Prefettizio ha impartito una direttiva per '
          "l'istituzione del Nucleo ambientale della Polizia Municipale.",
      data: '06 Feb 2026',
      categoria: 'avviso',
      isUrgente: true,
    ),
    NewsModel(
      id: '2',
      titolo: 'Referendum Costituzionale 22-23 Marzo 2026',
      descrizione:
          'Convocazione dei comizi elettorali per il Referendum Costituzionale. '
          'Tutte le informazioni per il voto.',
      data: '05 Feb 2026',
      categoria: 'avviso',
      isUrgente: true,
    ),
    NewsModel(
      id: '3',
      titolo: 'Manutenzione straordinaria via Gaglione',
      descrizione:
          'Nuova modifica del traffico veicolare per lavori di '
          'manutenzione straordinaria in via Gaglione.',
      data: '04 Feb 2026',
      categoria: 'avviso',
    ),
    NewsModel(
      id: '4',
      titolo: 'Manutenzione via M.L. King',
      descrizione:
          'Interventi di manutenzione in via M.L. King con modifica '
          'temporanea del traffico veicolare.',
      data: '03 Feb 2026',
      categoria: 'avviso',
    ),
    NewsModel(
      id: '5',
      titolo: 'Bando Home Care Premium INPS 2025-2028',
      descrizione:
          'Prestazioni integrative per il bando Home Care Premium INPS. '
          'Scadenza e modalità di partecipazione.',
      data: '01 Feb 2026',
      categoria: 'news',
    ),
  ];

  // === EVENTI ===
  static const List<EventoModel> eventi = [
    EventoModel(
      id: '1',
      titolo: "Concerto d'Estate: Note Sotto le Stelle",
      descrizione:
          'Una serata magica in Piazza Umberto I dedicata alle più famose '
          'colonne sonore del cinema italiano e internazionale.',
      data: '25 Gen 2026',
      ora: '15:30',
      luogo: 'Piazza Umberto I, Marcianise',
      categoria: 'Cultura & Musica',
    ),
    EventoModel(
      id: '2',
      titolo: "Festa dell'acqua",
      descrizione: "Grande evento dedicato all'acqua e alla sostenibilità.",
      data: '20 Gen 2026',
      ora: '10:00',
      luogo: 'Parco Comunale',
      categoria: 'Ambiente',
      isPassato: true,
    ),
    EventoModel(
      id: '3',
      titolo: 'Mercato KM 0',
      descrizione: 'Mercato dei prodotti locali a chilometro zero.',
      data: '15 Gen 2026',
      ora: '09:00',
      luogo: 'Via Marconi',
      categoria: 'Gastronomia',
      isPassato: true,
    ),
  ];
}
