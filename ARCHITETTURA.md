# Architettura App - Comune di Marcianise

## Panoramica

App mobile Flutter per il Comune di Marcianise (CE), con tema **VERDE SCURO istituzionale** come il [sito ufficiale](https://www.comune.marcianise.ce.it).
Progetto commissionato da MTK, strutturato in 5 moduli funzionali (A-E) + servizi al cittadino.
Sarà collegata ad un back office per la gestione dei contenuti.

---

## Stack Tecnologico

- **Linguaggio:** Dart
- **Framework:** Flutter 3.38.9
- **Stato:** StatefulWidget (futuro: Provider/Riverpod)
- **Navigazione:** Named Routes con Router centralizzato
- **Tema:** Material Design 3 - Verde Scuro Istituzionale (#008055)

---

## Struttura Cartelle

```text
lib/
├── main.dart                          # Entry point dell'app
├── core/                              # Configurazioni globali
│   ├── theme/
│   │   ├── app_colors.dart            # Palette colori (verde scuro)
│   │   ├── app_text_styles.dart       # Stili testo centralizzati
│   │   └── app_theme.dart             # ThemeData Material 3
│   ├── constants/
│   │   └── app_constants.dart         # Costanti (nomi, contatti, URL, dimensioni)
│   ├── utils/
│   │   └── snackbar_helper.dart       # Helper SnackBar (success/error/info/warning)
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
│   ├── comune_app_bar.dart            # AppBar personalizzata (supporta sottotitolo)
│   ├── comune_drawer.dart             # Menu laterale (hamburger)
│   ├── responsive_wrapper.dart        # Wrapper responsive per tablet/desktop/web
│   ├── servizio_card.dart             # Card servizio nella griglia
│   ├── meteo_widget.dart              # Widget previsioni meteo
│   ├── news_card.dart                 # Card notizia
│   └── evento_card.dart               # Card evento
└── screens/                           # Schermate dell'app
    ├── home/
    │   ├── home_screen.dart           # Schermata principale
    │   └── widgets/
    │       ├── hero_section.dart      # Sezione hero con FOTO REALE municipio
    │       ├── servizi_grid.dart      # Griglia 6 servizi
    │       └── novita_eventi_section.dart  # Tab Novità/Eventi
    ├── news/
    │   └── news_screen.dart           # Pagina News e Avvisi
    ├── consiglio/
    │   └── consiglio_screen.dart      # Pagina Consiglio Comunale
    ├── eventi/
    │   └── eventi_screen.dart         # Modulo C: Eventi
    ├── cultura/
    │   └── cultura_turismo_screen.dart # Modulo D: Cultura e Turismo
    ├── tributi/
    │   └── tributi_pagamenti_screen.dart # Modulo E: Tributi e Pagamenti
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

| Schermata | Modulo | File | Stato |
| --------- | ------ | ---- | ----- |
| Home | - | `screens/home/home_screen.dart` | ✅ Completata |
| News e Avvisi | A | `screens/news/news_screen.dart` | ✅ Completata |
| Consiglio Comunale | B | `screens/consiglio/consiglio_screen.dart` | ✅ Completata |
| Eventi | C | `screens/eventi/eventi_screen.dart` | ✅ Completata |
| Cultura e Turismo | D | `screens/cultura/cultura_turismo_screen.dart` | ✅ Completata |
| Tributi e Pagamenti | E | `screens/tributi/tributi_pagamenti_screen.dart` | ✅ Completata |
| Segnala Disservizio | Servizi | `screens/servizi/segnala_disservizio_screen.dart` | ✅ Completata |
| Prenota Ufficio | Servizi | `screens/servizi/prenota_ufficio_screen.dart` | ✅ Completata |
| Contatta Uffici | Servizi | `screens/servizi/contatta_uffici_screen.dart` | ✅ Completata |
| Gestione Rifiuti | Servizi | `screens/servizi/gestione_rifiuti_screen.dart` | ✅ Completata |
| Servizi Online | Servizi | `screens/servizi/servizi_online_screen.dart` | ✅ Completata |
| Luoghi di Interesse | Servizi | `screens/servizi/luoghi_interesse_screen.dart` | ✅ Completata |

---

## Design System

### Colori Principali

- **Primary:** `#008055` (Verde Scuro Istituzionale)
- **Primary Dark:** `#005C3E`
- **Primary Light:** `#4CAF82`
- **Accent:** `#66BB6A`
- **Background:** `#F5FFF8`
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
- [ ] Integrazione PagoPA per Modulo E
- [ ] Streaming video Consiglio Comunale per Modulo B
- [ ] Integrazione ANPR / Servizi Demografici

---

## Test

- **31 test** in 5 file:
  - `test/widget_test.dart` — avvio app (1 test)
  - `test/home_screen_test.dart` — AppBar, menu, notifiche, tab (4 test)
  - `test/navigation_test.dart` — drawer apertura, moduli, navigazione, etichette (4 test)
  - `test/app_constants_test.dart` — info comune, telefoni, URL servizi, dimensioni (17 test)
  - `test/snackbar_helper_test.dart` — success, error, info, warning, floating behavior (5 test)
- Tutti i test passano con `flutter test`
- Regole lint strict in `analysis_options.yaml` (prefer_const, avoid_print, etc.)

---

## Piattaforme

| Piattaforma | Launch Screen | Tema | Stato |
| ----------- | ------------- | ---- | ----- |
| Android | Verde scuro (#008055) | Verde | ✅ |
| iOS | Verde scuro (r:0, g:0.502, b:0.333) | Verde | ✅ |
| Web | Loading screen verde + spinner + lang=it + viewport | Verde | ✅ |
| Windows | Build release funzionante | Verde | ✅ |

---

## Note per Sviluppatori Futuri

1. I dati sono attualmente mock in `data/mock_data.dart` - sostituire con API reali
2. La foto del municipio è reale (`assets/images/municipio_marcianise.jpeg`) - il back office gestirà le immagini
3. Il logo del comune è un placeholder circolare - sostituire con SVG/PNG reale
4. Il widget meteo usa dati statici - integrare con API meteo (es. OpenWeatherMap)
5. Ogni schermata servizio ha form placeholder - collegare al back office
6. Il documento progetto MTK è in `docs/OF-APP-CM-011225.docx`
7. I 5 moduli (A-E) sono la struttura portante dell'app come da contratto MTK
8. Codice morto archiviato in `docs/codice_morto.dart` per riferimento
9. [Canale YouTube comune](https://www.youtube.com/channel/UCglEv_b7yTzb1hVB2HxYeGQ/videos) per Modulo B
10. Il tema globale include `InputDecorationTheme` e `TabBarTheme` per uniformità
11. `SnackBarHelper` in `core/utils/` per feedback consistente (success/error/info/warning)
12. `.editorconfig` per formattazione consistente tra editor
13. Loading screen verde web con spinner CSS durante caricamento Flutter
14. Manifest PWA con `lang: it`, `categories: [government, utilities]`
