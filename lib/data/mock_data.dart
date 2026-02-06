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

  // === SERVIZI GRIGLIA HOME ===
  static const List<ServizioModel> servizi = [
    ServizioModel(
      titolo: 'Segnala\ndisservizio',
      icona: Icons.warning_amber_rounded,
      coloreSfondo: AppColors.cardService1,
      coloreIcona: AppColors.primary,
      rotta: AppRoutes.segnalaDisservizio,
    ),
    ServizioModel(
      titolo: 'Prenota\nufficio',
      icona: Icons.business_rounded,
      coloreSfondo: AppColors.cardService2,
      coloreIcona: Color(0xFF43A047),
      rotta: AppRoutes.prenotaUfficio,
    ),
    ServizioModel(
      titolo: 'Contatta\ngli uffici',
      icona: Icons.headset_mic_rounded,
      coloreSfondo: AppColors.cardService3,
      coloreIcona: Color(0xFFE65100),
      rotta: AppRoutes.contattaUffici,
    ),
    ServizioModel(
      titolo: 'Gestione\ndei rifiuti',
      icona: Icons.delete_outline_rounded,
      coloreSfondo: AppColors.cardService4,
      coloreIcona: Color(0xFFC62828),
      rotta: AppRoutes.gestioneRifiuti,
    ),
    ServizioModel(
      titolo: 'Servizi\nonline',
      icona: Icons.language_rounded,
      coloreSfondo: AppColors.cardService5,
      coloreIcona: Color(0xFF00838F),
      rotta: AppRoutes.serviziOnline,
    ),
    ServizioModel(
      titolo: 'Luoghi di\ninteresse',
      icona: Icons.place_rounded,
      coloreSfondo: AppColors.cardService6,
      coloreIcona: Color(0xFF6A1B9A),
      rotta: AppRoutes.luoghiInteresse,
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

  // === NEWS E AVVISI ===
  static const List<NewsModel> news = [
    NewsModel(
      id: '1',
      titolo: 'Lavori in corso: Via Roma',
      descrizione:
          'Interruzione del traffico prevista per la giornata di domani. '
          'Si prega di utilizzare percorsi alternativi.',
      data: '25 Gen 2026',
      categoria: 'avviso',
      isUrgente: true,
    ),
    NewsModel(
      id: '2',
      titolo: 'Nuova Apertura - "Parco Giochi EcoSostenibile"',
      descrizione:
          'Inaugurazione del nuovo parco giochi ecosostenibile in Piazza Municipio.',
      data: '23 Gen 2026',
      categoria: 'news',
    ),
    NewsModel(
      id: '3',
      titolo: 'Bando per contributi alle famiglie',
      descrizione:
          'Pubblicato il nuovo bando per il sostegno economico alle famiglie in difficoltà.',
      data: '20 Gen 2026',
      categoria: 'news',
    ),
    NewsModel(
      id: '4',
      titolo: 'Chiusura uffici per festività',
      descrizione:
          'Gli uffici comunali resteranno chiusi il 6 febbraio per la festa patronale.',
      data: '18 Gen 2026',
      categoria: 'avviso',
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
