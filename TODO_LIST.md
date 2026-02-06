# TODO List - App Comune di Marcianise

## Legenda

- ✅ = Completato
- 🔄 = In corso
- ⏳ = Da fare
- 🔴 = Urgente / Bloccante

---

## UI / Frontend

### Completati ✅

- [x] Struttura progetto Flutter modulare
- [x] Tema VERDE SCURO istituzionale (#008055) come sito comune
- [x] Home Page con FOTO REALE municipio, meteo, griglia 5 moduli MTK, novità/eventi
- [x] Pagina News e Avvisi con tab e filtro
- [x] Pagina Consiglio Comunale con video (Modulo B)
- [x] Pagina Eventi con eventi futuri e passati (Modulo C)
- [x] Pagina Cultura e Turismo (Modulo D) - NUOVA
- [x] Pagina Tributi e Pagamenti con PagoPA (Modulo E) - NUOVA
- [x] Pagina Segnala Disservizio con form
- [x] Pagina Prenota Ufficio con lista uffici
- [x] Pagina Contatta Uffici con sede municipale reale (indirizzo, PEC, telefono)
- [x] Pagina Gestione Rifiuti con calendario e centro raccolta
- [x] Pagina Servizi Online con dati reali (ANPR, PagoPA, SUAP, SUE, Albo Pretorio)
- [x] Pagina Luoghi di Interesse
- [x] Pagina Prenota Ufficio con uffici reali (Anagrafe, Tributi, URP, Servizi Sociali)
- [x] Drawer menu laterale con moduli A-E + footer contatti reali
- [x] Widget AppBar personalizzata con tooltip accessibilità
- [x] Widget meteo con previsioni 3 giorni
- [x] Card riutilizzabili (News, Eventi, Servizi)
- [x] Griglia servizi RESPONSIVE (3/4/6 colonne per mobile/tablet/desktop)
- [x] Overlay gradiente verde su hero per continuità con AppBar
- [x] Altezza tab novità/eventi adattiva per schermi diversi
- [x] Contatti reali comune in AppConstants (Via Roma 18, tel, email, PEC, social)
- [x] InputDecorationTheme + TabBarTheme nel tema globale
- [x] Accessibilità: semanticLabel foto municipio, tooltip bottoni
- [x] SnackBarHelper utility per feedback consistente (success/error/info/warning)
- [x] Prenota Ufficio con orari apertura reali per ogni ufficio
- [x] Servizi Online con feedback SnackBar al tap
- [x] Luoghi di interesse reali Marcianise (Duomo, Castello/Torrione, S.Francesco)
- [x] URL costanti servizi online centralizzati in AppConstants
- [x] Telefoni e email uffici centralizzati in AppConstants
- [x] Tooltip completi su tutti i pulsanti AppBar (back, menu, notifiche)
- [x] Padding hardcoded sostituiti con AppConstants per coerenza
- [x] `.editorconfig` per formattazione consistente tra editor
- [x] 34 ottimizzazioni `const` per performance widget
- [x] Regole lint strict in `analysis_options.yaml` (prefer_const, avoid_print)
- [x] Semantics label su logo placeholder AppBar per screen reader
- [x] Loading screen verde web con spinner CSS durante caricamento
- [x] Manifest PWA completo (lang:it, categories:[government,utilities], scope)
- [x] Meta tag viewport + lang=it in `index.html` per responsività web
- [x] 64 test in 7 file (widget, home, nav, constants, snackbar, theme, router)
- [x] Comunicazioni Sindaco (sez.4): carica immagini, video, comunicati
- [x] Servizi Scolastici (sez.5): aggiungi/modifica/elimina servizi
- [x] CRUD Notizie (sez.1): crea con titolo/contenuto/criticità + statistiche
- [x] CRUD Eventi (sez.2): crea con titolo/contenuto/geolocalizzazione
- [x] CRUD POI (sez.3): crea con nome/descrizione/geolocalizzazione + modifica/elimina
- [x] Home grid espansa a 8 card (5 moduli + sindaco + scolastici + servizi)

### Da Fare UI ⏳

- [x] ~~Aggiungere immagine reale del municipio nella hero section~~ FATTO!
- [x] ~~Accessibilità base (semanticLabel, tooltip)~~ FATTO!
- [ ] Aggiungere logo reale del Comune di Marcianise (SVG/PNG)
- [ ] Splash screen con logo comune
- [ ] Animazioni di transizione tra pagine
- [ ] Pull-to-refresh nelle liste
- [ ] Skeleton loading per contenuti in caricamento
- [ ] Dark mode (opzionale)
- [ ] Localizzazione multilingua (opzionale)

---

## Backend / Integrazione

### Da Fare Backend ⏳

- [ ] 🔴 Definire API REST con il back office
- [ ] 🔴 Implementare chiamate HTTP (package `http` o `dio`)
- [ ] 🔴 State management (Provider/Riverpod)
- [ ] Autenticazione utente (SPID / CIE)
- [ ] Push notifications (Firebase Cloud Messaging)
- [ ] Cache offline dati (Hive / SharedPreferences)
- [ ] Upload foto per segnalazioni
- [ ] Integrazione API meteo reale (OpenWeatherMap)
- [ ] Integrazione mappa per luoghi di interesse (Google Maps)
- [ ] Deep linking per notifiche

---

## Infrastruttura

### Da Fare Infrastruttura ⏳

- [ ] Configurazione CI/CD per build automatiche
- [ ] Setup Firebase per analytics e crash reporting
- [ ] Configurazione per release Android (Play Store)
- [ ] Configurazione per release iOS (App Store)
- [x] ~~Testing automatizzato~~ 64 test in 7 file (widget, home, nav, constants, snackbar, theme, router)

---

## Miglioramenti Futuri

- [ ] Sezione "Comunicati Stampa"
- [ ] Chat con assistente virtuale del comune
- [x] ~~Pagamento tributi in-app~~ Schermata base creata (Modulo E)
- [ ] QR code per servizi rapidi
- [ ] Sezione "Bandi e Concorsi"
- [ ] Mappa interattiva della città
- [ ] Calendario eventi con vista mensile
- [ ] Feedback e valutazione servizi

---

## Note

- I dati attuali sono mock in `lib/data/mock_data.dart` (news reali dal sito comune)
- L'app deve funzionare su tutti i dispositivi (Android, iOS, Web)
- Il back office fornirà le API per i dati dinamici
- Documento progetto MTK: `docs/OF-APP-CM-011225.docx`
- Codice morto archiviato in `docs/codice_morto.dart`
- 5 moduli funzionali: A (News), B (Consiglio), C (Eventi), D (Cultura), E (Tributi)
- [Canale YouTube comune](https://www.youtube.com/channel/UCglEv_b7yTzb1hVB2HxYeGQ/videos)
- 67+ commit su GitHub (master)
- Ultimo aggiornamento: 7 Febbraio 2026


STRUTTURA RICHIESTA DA RISPETTARE AL 100%

la struttura dell'app organizzata con la numerazione gerarchica richiesta:

Configurazione Contenuti App
1. Notizie

1.1. Crea Notizie

1.1.1. Titolo

1.1.2. Contenuto

1.1.3. Criticità

1.1.3.1. Invio notifica in base alla criticità

1.2. Visualizza Notizie

1.2.1. Visualizza statistiche notizia

1.3. Modifica/elimina Notizie

2. Eventi

2.1. Visualizza Eventi

2.2. Crea nuovo evento

2.2.1. Titolo

2.2.2. Contenuto

2.2.3. Geolocalizzazione

2.3. Modifica/Elimina evento

3. Punti di interesse

3.1. Crea nuovo POI

3.1.1. Nome

3.1.2. Descrizione

3.1.3. Geolocalizzazione

3.2. Visualizza POI

3.3. Modifica/elimina POI

4. Comunicazioni sindaco

4.1. Carica immagini

4.2. Carica video

4.3. Inserisci Comunicati

5. Servizi Scolastici

5.1. Aggiungi servizi

5.2. Modifica/elimina servizi