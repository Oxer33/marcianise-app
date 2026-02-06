# 🏛️ App Comune di Marcianise

App mobile ufficiale del **Comune di Marcianise** (CE), sviluppata in Flutter/Dart.

Tema **verde scuro istituzionale** (#008055) come il [sito ufficiale](https://www.comune.marcianise.ce.it).
Progetto commissionato da MTK, strutturato in **5 moduli funzionali** (A-E).

## 📱 Funzionalità

### Moduli Principali (da documento progetto MTK)

- **Modulo A** - News e Avvisi istituzionali con filtro per categoria
- **Modulo B** - Consiglio Comunale con video delle sedute
- **Modulo C** - Eventi, manifestazioni e iniziative del territorio
- **Modulo D** - Cultura e Turismo (chiese, monumenti, biblioteca, impianti sportivi)
- **Modulo E** - Tributi e Pagamenti con integrazione PagoPA

### Servizi al Cittadino

- **Segnala Disservizio** con form completo
- **Prenota Ufficio** con lista uffici disponibili
- **Contatta Uffici** con sede municipale, numeri, email, PEC e orari
- **Gestione Rifiuti** con calendario raccolta differenziata
- **Servizi Online** con link ai servizi digitali
- **Luoghi di Interesse** con monumenti e punti di interesse

### Home Page

- Foto **reale** del Municipio di Marcianise (notturna)
- Widget previsioni meteo sovrapposto
- Griglia 8 servizi rapidi **responsive** (4/4/8 colonne)
- Sezione Novità e Eventi con tab

## ✅ Qualità

- **64 test automatizzati** (widget + unit) in 7 file
- **0 errori** `flutter analyze`
- **Build verificati:** Windows, Web
- **Loading screen verde** per web con spinner CSS
- **PWA ready** con manifest completo (lang: it, categories: government)
- **Accessibilità:** semanticLabel, tooltip su tutti i pulsanti
- **SnackBarHelper** per feedback UX consistente
- **14 schermate** con struttura richiesta al 100% (5 sezioni CRUD)

## 🛠️ Stack Tecnologico

- **Linguaggio:** Dart
- **Framework:** Flutter 3.38.9
- **Design:** Material Design 3 (tema verde scuro #008055)
- **Piattaforme:** Android, iOS, Web, Windows

## 🚀 Come Avviare

```bash
# Installa le dipendenze
flutter pub get

# Avvia in modalità debug
flutter run

# Build per Windows
flutter build windows

# Build per Android
flutter build apk

# Build per Web
flutter build web
```

## 📂 Struttura Progetto

Vedi il file [ARCHITETTURA.md](ARCHITETTURA.md) per la struttura completa delle cartelle e dei file.

## 📋 Roadmap

Vedi il file [TODO_LIST.md](TODO_LIST.md) per la lista completa delle funzionalità pianificate.

## 👥 Team

Sviluppato per il Comune di Marcianise (CE).

## 📄 Licenza

Progetto proprietario - Tutti i diritti riservati © 2026 Comune di Marcianise.
