# Architettura App - Comune di Marcianise

## Panoramica
App mobile Flutter per il Comune di Marcianise, ispirata allo stile dell'app "Città di San Donà di Piave" (tema blu).
Sarà collegata ad un back office per la gestione dei contenuti.

---

## Stack Tecnologico
- **Linguaggio:** Dart
- **Framework:** Flutter 3.38.9
- **Stato:** StatefulWidget (futuro: Provider/Riverpod)
- **Navigazione:** Named Routes con Router centralizzato
- **Tema:** Material Design 3 - Blu

---

## Struttura Cartelle

```
lib/
├── main.dart                          # Entry point dell'app
├── core/                              # Configurazioni globali
│   ├── theme/
│   │   ├── app_colors.dart            # Palette colori (blu)
│   │   ├── app_text_styles.dart       # Stili testo centralizzati
│   │   └── app_theme.dart             # ThemeData Material 3
│   ├── constants/
│   │   └── app_constants.dart         # Costanti (nomi, dimensioni)
│   └── routes/
│       ├── app_routes.dart            # Definizione percorsi
│       └── app_router.dart            # Router centralizzato
├── models/                            # Modelli dati
│   ├── servizio_model.dart            # Modello servizio griglia
│   ├── news_model.dart                # Modello notizia/avviso
│   ├── evento_model.dart              # Modello evento
│   └── meteo_model.dart               # Modello previsioni meteo
├── data/
│   └── mock_data.dart                 # Dati finti per sviluppo
├── widgets/                           # Widget riutilizzabili
│   ├── comune_app_bar.dart            # AppBar personalizzata
│   ├── comune_drawer.dart             # Menu laterale (hamburger)
│   ├── servizio_card.dart             # Card servizio nella griglia
│   ├── meteo_widget.dart              # Widget previsioni meteo
│   ├── news_card.dart                 # Card notizia
│   └── evento_card.dart               # Card evento
└── screens/                           # Schermate dell'app
    ├── home/
    │   ├── home_screen.dart           # Schermata principale
    │   └── widgets/
    │       ├── hero_section.dart      # Sezione hero con meteo
    │       ├── servizi_grid.dart      # Griglia 6 servizi
    │       └── novita_eventi_section.dart  # Tab Novità/Eventi
    ├── news/
    │   └── news_screen.dart           # Pagina News e Avvisi
    ├── consiglio/
    │   └── consiglio_screen.dart      # Pagina Consiglio Comunale
    ├── eventi/
    │   └── eventi_screen.dart         # Pagina Eventi
    └── servizi/
        ├── segnala_disservizio_screen.dart
        ├── prenota_ufficio_screen.dart
        ├── contatta_uffici_screen.dart
        ├── gestione_rifiuti_screen.dart
        ├── servizi_online_screen.dart
        └── luoghi_interesse_screen.dart
```

---

## Schermate Implementate

| Schermata | File | Stato |
|-----------|------|-------|
| Home | `screens/home/home_screen.dart` | ✅ Completata |
| News e Avvisi | `screens/news/news_screen.dart` | ✅ Completata |
| Consiglio Comunale | `screens/consiglio/consiglio_screen.dart` | ✅ Completata |
| Eventi | `screens/eventi/eventi_screen.dart` | ✅ Completata |
| Segnala Disservizio | `screens/servizi/segnala_disservizio_screen.dart` | ✅ Completata |
| Prenota Ufficio | `screens/servizi/prenota_ufficio_screen.dart` | ✅ Completata |
| Contatta Uffici | `screens/servizi/contatta_uffici_screen.dart` | ✅ Completata |
| Gestione Rifiuti | `screens/servizi/gestione_rifiuti_screen.dart` | ✅ Completata |
| Servizi Online | `screens/servizi/servizi_online_screen.dart` | ✅ Completata |
| Luoghi di Interesse | `screens/servizi/luoghi_interesse_screen.dart` | ✅ Completata |

---

## Design System

### Colori Principali
- **Primary:** `#1565C0` (Blu)
- **Primary Dark:** `#0D47A1`
- **Primary Light:** `#42A5F5`
- **Accent:** `#29B6F6`
- **Background:** `#F5F9FF`
- **Surface:** `#FFFFFF`

### Tipografia
- Font: Roboto (default Material)
- Heading1: 24px Bold
- Heading2: 20px Bold
- Heading3: 16px SemiBold
- Body: 14px Regular
- Small: 12px Regular

---

## Integrazione Back Office (DA FARE)
- [ ] API REST per recupero dati dinamici
- [ ] Autenticazione utenti (SPID/CIE)
- [ ] Push notifications
- [ ] Upload immagini per segnalazioni
- [ ] Gestione contenuti CMS

---

## Note per Sviluppatori Futuri
1. I dati sono attualmente mock in `data/mock_data.dart` - sostituire con API reali
2. Le immagini sono placeholder - aggiungere immagini reali in `assets/images/`
3. Il logo del comune è un placeholder circolare - sostituire con SVG/PNG reale
4. Il widget meteo usa dati statici - integrare con API meteo (es. OpenWeatherMap)
5. Ogni schermata servizio ha form placeholder - collegare al back office
