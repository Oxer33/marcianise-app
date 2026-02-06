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
- [x] Tema blu (Material Design 3)
- [x] Home Page con hero image, meteo, griglia servizi, novità/eventi
- [x] Pagina News e Avvisi con tab e filtro
- [x] Pagina Consiglio Comunale con video
- [x] Pagina Eventi con eventi futuri e passati
- [x] Pagina Segnala Disservizio con form
- [x] Pagina Prenota Ufficio con lista uffici
- [x] Pagina Contatta Uffici con contatti
- [x] Pagina Gestione Rifiuti con calendario
- [x] Pagina Servizi Online con lista servizi
- [x] Pagina Luoghi di Interesse
- [x] Drawer menu laterale completo
- [x] Widget AppBar personalizzata
- [x] Widget meteo con previsioni 3 giorni
- [x] Card riutilizzabili (News, Eventi, Servizi)

### Da Fare UI ⏳

- [ ] Aggiungere immagine reale del municipio nella hero section
- [ ] Aggiungere logo reale del Comune di Marcianise (SVG/PNG)
- [ ] Splash screen con logo comune
- [ ] Animazioni di transizione tra pagine
- [ ] Pull-to-refresh nelle liste
- [ ] Skeleton loading per contenuti in caricamento
- [ ] Dark mode (opzionale)
- [ ] Accessibilità (screen reader, contrasto colori)
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
- [ ] Testing automatizzato (unit test, widget test)

---

## Miglioramenti Futuri

- [ ] Sezione "Comunicati Stampa"
- [ ] Chat con assistente virtuale del comune
- [ ] Pagamento tributi in-app
- [ ] QR code per servizi rapidi
- [ ] Sezione "Bandi e Concorsi"
- [ ] Mappa interattiva della città
- [ ] Calendario eventi con vista mensile
- [ ] Feedback e valutazione servizi

---

## Note

- I dati attuali sono mock (finti) in `lib/data/mock_data.dart`
- L'app deve funzionare su tutti i dispositivi (Android, iOS, Web)
- Il back office fornirà le API per i dati dinamici
- Ultimo aggiornamento: 6 Febbraio 2026
