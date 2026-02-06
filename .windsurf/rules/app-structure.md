---
trigger: always_on
---

STRUTTURA RICHIESTA DA RISPETTARE AL 100%

la struttura dell'app organizzata con la numerazione gerarchica richiesta:

Configurazione Contenuti App
1. Notizie ✅ → `lib/screens/news/news_screen.dart` + `lib/widgets/news_card.dart`

1.1. Crea Notizie ✅ → FAB "Crea Notizia" + BottomSheet form

1.1.1. Titolo ✅ → TextField "Titolo della notizia"

1.1.2. Contenuto ✅ → TextField multiline "Contenuto della notizia"

1.1.3. Criticità ✅ → Selettore chip (Bassa/Media/Alta)

1.1.3.1. Invio notifica in base alla criticità ✅ → Info box con icona notifica

1.2. Visualizza Notizie ✅ → TabBar News/Avvisi + ListView

1.2.1. Visualizza statistiche notizia ✅ → Banner + Dialog statistiche dettagliate

1.3. Modifica/elimina Notizie ✅ → PopupMenuButton su ogni NewsCard

2. Eventi ✅ → `lib/screens/eventi/eventi_screen.dart` + `lib/widgets/evento_card.dart`

2.1. Visualizza Eventi ✅ → Lista eventi futuri + scroll orizzontale passati

2.2. Crea nuovo evento ✅ → FAB "Crea Evento" + BottomSheet form

2.2.1. Titolo ✅ → TextField "Titolo dell'evento"

2.2.2. Contenuto ✅ → TextField multiline "Contenuto / Descrizione"

2.2.3. Geolocalizzazione ✅ → Area mappa placeholder (collegare GPS)

2.3. Modifica/Elimina evento ✅ → PopupMenuButton su ogni EventoCard

3. Punti di interesse ✅ → `lib/screens/servizi/luoghi_interesse_screen.dart`

3.1. Crea nuovo POI ✅ → FAB "Crea POI" + BottomSheet form

3.1.1. Nome ✅ → TextField "Nome del punto di interesse"

3.1.2. Descrizione ✅ → TextField multiline "Descrizione"

3.1.3. Geolocalizzazione ✅ → Area mappa placeholder (collegare GPS)

3.2. Visualizza POI ✅ → Lista 7 POI reali di Marcianise

3.3. Modifica/elimina POI ✅ → PopupMenuButton su ogni LuogoCard

4. Comunicazioni sindaco ✅ → `lib/screens/sindaco/comunicazioni_sindaco_screen.dart`

4.1. Carica immagini ✅ → Card + BottomSheet upload area

4.2. Carica video ✅ → Card + BottomSheet upload area

4.3. Inserisci Comunicati ✅ → Card + BottomSheet form + PopupMenu modifica/elimina

5. Servizi Scolastici ✅ → `lib/screens/scolastici/servizi_scolastici_screen.dart`

5.1. Aggiungi servizi ✅ → FAB "Aggiungi Servizio" + BottomSheet form

5.2. Modifica/elimina servizi ✅ → PopupMenuButton su ogni ServizioCard