import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('it')];

  /// No description provided for @appName.
  ///
  /// In it, this message translates to:
  /// **'Comune di Marcianise'**
  String get appName;

  /// No description provided for @navHome.
  ///
  /// In it, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navNews.
  ///
  /// In it, this message translates to:
  /// **'News e Avvisi'**
  String get navNews;

  /// No description provided for @navConsiglio.
  ///
  /// In it, this message translates to:
  /// **'Consiglio Comunale'**
  String get navConsiglio;

  /// No description provided for @navEventiManifestazioni.
  ///
  /// In it, this message translates to:
  /// **'Eventi e Manifestazioni'**
  String get navEventiManifestazioni;

  /// No description provided for @navCultura.
  ///
  /// In it, this message translates to:
  /// **'Cultura e Turismo'**
  String get navCultura;

  /// No description provided for @navTributi.
  ///
  /// In it, this message translates to:
  /// **'Tributi e Pagamenti'**
  String get navTributi;

  /// No description provided for @navComunicazioniSindaco.
  ///
  /// In it, this message translates to:
  /// **'Comunicazioni Sindaco'**
  String get navComunicazioniSindaco;

  /// No description provided for @navServiziScolastici.
  ///
  /// In it, this message translates to:
  /// **'Servizi Scolastici'**
  String get navServiziScolastici;

  /// No description provided for @navSegnalaDisservizio.
  ///
  /// In it, this message translates to:
  /// **'Segnala Disservizio'**
  String get navSegnalaDisservizio;

  /// No description provided for @navPrenotaUfficio.
  ///
  /// In it, this message translates to:
  /// **'Prenota Ufficio'**
  String get navPrenotaUfficio;

  /// No description provided for @navContattaUffici.
  ///
  /// In it, this message translates to:
  /// **'Contatta Uffici'**
  String get navContattaUffici;

  /// No description provided for @navGestioneRifiuti.
  ///
  /// In it, this message translates to:
  /// **'Gestione Rifiuti'**
  String get navGestioneRifiuti;

  /// No description provided for @navServiziOnline.
  ///
  /// In it, this message translates to:
  /// **'Servizi Online'**
  String get navServiziOnline;

  /// No description provided for @navLuoghiInteresse.
  ///
  /// In it, this message translates to:
  /// **'Luoghi di Interesse'**
  String get navLuoghiInteresse;

  /// No description provided for @drawerSectionMain.
  ///
  /// In it, this message translates to:
  /// **'Moduli Principali'**
  String get drawerSectionMain;

  /// No description provided for @drawerSectionStructure.
  ///
  /// In it, this message translates to:
  /// **'Struttura App'**
  String get drawerSectionStructure;

  /// No description provided for @drawerSectionServices.
  ///
  /// In it, this message translates to:
  /// **'Servizi Cittadino'**
  String get drawerSectionServices;

  /// No description provided for @homeTitleComune.
  ///
  /// In it, this message translates to:
  /// **'Comune di'**
  String get homeTitleComune;

  /// No description provided for @homeSubtitleCity.
  ///
  /// In it, this message translates to:
  /// **'MARCIANISE'**
  String get homeSubtitleCity;

  /// No description provided for @homeHighlightsTitle.
  ///
  /// In it, this message translates to:
  /// **'In evidenza'**
  String get homeHighlightsTitle;

  /// No description provided for @homeTabNews.
  ///
  /// In it, this message translates to:
  /// **'Novità'**
  String get homeTabNews;

  /// No description provided for @homeTabEvents.
  ///
  /// In it, this message translates to:
  /// **'Eventi'**
  String get homeTabEvents;

  /// No description provided for @homeSeeAllNews.
  ///
  /// In it, this message translates to:
  /// **'Vedi tutte le novità'**
  String get homeSeeAllNews;

  /// No description provided for @homeSeeAllEvents.
  ///
  /// In it, this message translates to:
  /// **'Vedi tutti gli eventi'**
  String get homeSeeAllEvents;

  /// No description provided for @highlightNewsTitle.
  ///
  /// In it, this message translates to:
  /// **'News & Avvisi'**
  String get highlightNewsTitle;

  /// No description provided for @highlightNewsPrefix.
  ///
  /// In it, this message translates to:
  /// **'Aggiornamenti '**
  String get highlightNewsPrefix;

  /// No description provided for @highlightNewsEmphasis.
  ///
  /// In it, this message translates to:
  /// **'urgenti'**
  String get highlightNewsEmphasis;

  /// No description provided for @highlightNewsSuffix.
  ///
  /// In it, this message translates to:
  /// **' e comunicazioni ufficiali.'**
  String get highlightNewsSuffix;

  /// No description provided for @highlightServicesTitle.
  ///
  /// In it, this message translates to:
  /// **'Servizi online'**
  String get highlightServicesTitle;

  /// No description provided for @highlightServicesPrefix.
  ///
  /// In it, this message translates to:
  /// **'Accesso '**
  String get highlightServicesPrefix;

  /// No description provided for @highlightServicesEmphasis.
  ///
  /// In it, this message translates to:
  /// **'rapido'**
  String get highlightServicesEmphasis;

  /// No description provided for @highlightServicesSuffix.
  ///
  /// In it, this message translates to:
  /// **' a PagoPA, ANPR e pratiche.'**
  String get highlightServicesSuffix;

  /// No description provided for @highlightEventsTitle.
  ///
  /// In it, this message translates to:
  /// **'Eventi e cultura'**
  String get highlightEventsTitle;

  /// No description provided for @highlightEventsPrefix.
  ///
  /// In it, this message translates to:
  /// **'Agenda '**
  String get highlightEventsPrefix;

  /// No description provided for @highlightEventsEmphasis.
  ///
  /// In it, this message translates to:
  /// **'viva'**
  String get highlightEventsEmphasis;

  /// No description provided for @highlightEventsSuffix.
  ///
  /// In it, this message translates to:
  /// **' tra eventi e turismo locale.'**
  String get highlightEventsSuffix;

  /// No description provided for @screenNewsTitle.
  ///
  /// In it, this message translates to:
  /// **'News e Avvisi'**
  String get screenNewsTitle;

  /// No description provided for @screenEventiTitle.
  ///
  /// In it, this message translates to:
  /// **'Eventi e Manifestazioni'**
  String get screenEventiTitle;

  /// No description provided for @screenConsiglioTitle.
  ///
  /// In it, this message translates to:
  /// **'Consiglio Comunale'**
  String get screenConsiglioTitle;

  /// No description provided for @screenCulturaTurismoTitle.
  ///
  /// In it, this message translates to:
  /// **'Cultura e Turismo'**
  String get screenCulturaTurismoTitle;

  /// No description provided for @screenTributiTitle.
  ///
  /// In it, this message translates to:
  /// **'Tributi e Pagamenti'**
  String get screenTributiTitle;

  /// No description provided for @screenComunicazioniSindacoTitle.
  ///
  /// In it, this message translates to:
  /// **'Comunicazioni Sindaco'**
  String get screenComunicazioniSindacoTitle;

  /// No description provided for @screenServiziScolasticiTitle.
  ///
  /// In it, this message translates to:
  /// **'Servizi Scolastici'**
  String get screenServiziScolasticiTitle;

  /// No description provided for @screenSegnalaDisservizioTitle.
  ///
  /// In it, this message translates to:
  /// **'Segnala Disservizio'**
  String get screenSegnalaDisservizioTitle;

  /// No description provided for @screenPrenotaUfficioTitle.
  ///
  /// In it, this message translates to:
  /// **'Prenota Ufficio'**
  String get screenPrenotaUfficioTitle;

  /// No description provided for @screenContattaUfficiTitle.
  ///
  /// In it, this message translates to:
  /// **'Contatta Uffici'**
  String get screenContattaUfficiTitle;

  /// No description provided for @screenGestioneRifiutiTitle.
  ///
  /// In it, this message translates to:
  /// **'Gestione Rifiuti'**
  String get screenGestioneRifiutiTitle;

  /// No description provided for @screenServiziOnlineTitle.
  ///
  /// In it, this message translates to:
  /// **'Servizi Online'**
  String get screenServiziOnlineTitle;

  /// No description provided for @screenLuoghiInteresseTitle.
  ///
  /// In it, this message translates to:
  /// **'Luoghi di Interesse'**
  String get screenLuoghiInteresseTitle;

  /// No description provided for @actionCreaNotizia.
  ///
  /// In it, this message translates to:
  /// **'Crea Notizia'**
  String get actionCreaNotizia;

  /// No description provided for @actionCreaEvento.
  ///
  /// In it, this message translates to:
  /// **'Crea Evento'**
  String get actionCreaEvento;

  /// No description provided for @actionCreaPoi.
  ///
  /// In it, this message translates to:
  /// **'Crea POI'**
  String get actionCreaPoi;

  /// No description provided for @actionAggiungiServizio.
  ///
  /// In it, this message translates to:
  /// **'Aggiungi Servizio'**
  String get actionAggiungiServizio;

  /// No description provided for @actionStatistiche.
  ///
  /// In it, this message translates to:
  /// **'Statistiche'**
  String get actionStatistiche;

  /// No description provided for @actionFilterByDate.
  ///
  /// In it, this message translates to:
  /// **'Filtra per data'**
  String get actionFilterByDate;

  /// No description provided for @actionClose.
  ///
  /// In it, this message translates to:
  /// **'Chiudi'**
  String get actionClose;

  /// No description provided for @eventiToday.
  ///
  /// In it, this message translates to:
  /// **'Oggi'**
  String get eventiToday;

  /// No description provided for @eventiFilterComingSoon.
  ///
  /// In it, this message translates to:
  /// **'Filtro per data - funzionalità in arrivo!'**
  String get eventiFilterComingSoon;

  /// No description provided for @eventiEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessun evento in programma'**
  String get eventiEmpty;

  /// No description provided for @eventiPastTitle.
  ///
  /// In it, this message translates to:
  /// **'Eventi Passati'**
  String get eventiPastTitle;

  /// No description provided for @newsTabNews.
  ///
  /// In it, this message translates to:
  /// **'News'**
  String get newsTabNews;

  /// No description provided for @newsTabAvvisi.
  ///
  /// In it, this message translates to:
  /// **'Avvisi'**
  String get newsTabAvvisi;

  /// No description provided for @statsNews.
  ///
  /// In it, this message translates to:
  /// **'News'**
  String get statsNews;

  /// No description provided for @statsAvvisi.
  ///
  /// In it, this message translates to:
  /// **'Avvisi'**
  String get statsAvvisi;

  /// No description provided for @statsUrgenti.
  ///
  /// In it, this message translates to:
  /// **'Urgenti'**
  String get statsUrgenti;

  /// No description provided for @statsTotale.
  ///
  /// In it, this message translates to:
  /// **'Totale'**
  String get statsTotale;

  /// No description provided for @newsStatsDialogTitle.
  ///
  /// In it, this message translates to:
  /// **'Statistiche Notizie'**
  String get newsStatsDialogTitle;

  /// No description provided for @newsStatsPublished.
  ///
  /// In it, this message translates to:
  /// **'News pubblicate'**
  String get newsStatsPublished;

  /// No description provided for @newsStatsAvvisi.
  ///
  /// In it, this message translates to:
  /// **'Avvisi pubblicati'**
  String get newsStatsAvvisi;

  /// No description provided for @newsStatsFooter.
  ///
  /// In it, this message translates to:
  /// **'Statistiche dettagliate saranno disponibili con il back office.'**
  String get newsStatsFooter;

  /// No description provided for @poiHeaderTitle.
  ///
  /// In it, this message translates to:
  /// **'Luoghi di interesse'**
  String get poiHeaderTitle;

  /// No description provided for @poiHeaderSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Scopri i monumenti, le chiese e i luoghi più belli di Marcianise e dintorni.'**
  String get poiHeaderSubtitle;

  /// No description provided for @scolasticiActiveServicesTitle.
  ///
  /// In it, this message translates to:
  /// **'Servizi Attivi'**
  String get scolasticiActiveServicesTitle;

  /// No description provided for @serviziOnlineHeaderSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Accedi ai servizi digitali del comune comodamente da casa.'**
  String get serviziOnlineHeaderSubtitle;

  /// No description provided for @emptyGeneric.
  ///
  /// In it, this message translates to:
  /// **'Nessun elemento trovato'**
  String get emptyGeneric;

  /// No description provided for @actionEdit.
  ///
  /// In it, this message translates to:
  /// **'Modifica'**
  String get actionEdit;

  /// No description provided for @actionDelete.
  ///
  /// In it, this message translates to:
  /// **'Elimina'**
  String get actionDelete;

  /// No description provided for @actionGoToPagopa.
  ///
  /// In it, this message translates to:
  /// **'Vai a PagoPA'**
  String get actionGoToPagopa;

  /// No description provided for @labelUrgente.
  ///
  /// In it, this message translates to:
  /// **'Urgente'**
  String get labelUrgente;

  /// No description provided for @statusActive.
  ///
  /// In it, this message translates to:
  /// **'Attivo'**
  String get statusActive;

  /// No description provided for @statusSeasonal.
  ///
  /// In it, this message translates to:
  /// **'Stagionale'**
  String get statusSeasonal;

  /// No description provided for @statusPending.
  ///
  /// In it, this message translates to:
  /// **'In attesa'**
  String get statusPending;

  /// No description provided for @statusPaid.
  ///
  /// In it, this message translates to:
  /// **'Pagato'**
  String get statusPaid;

  /// No description provided for @tooltipBack.
  ///
  /// In it, this message translates to:
  /// **'Torna indietro'**
  String get tooltipBack;

  /// No description provided for @tooltipMenu.
  ///
  /// In it, this message translates to:
  /// **'Apri menu'**
  String get tooltipMenu;

  /// No description provided for @tooltipNotifications.
  ///
  /// In it, this message translates to:
  /// **'Notifiche'**
  String get tooltipNotifications;

  /// No description provided for @semanticLogoComune.
  ///
  /// In it, this message translates to:
  /// **'Logo Comune di Marcianise'**
  String get semanticLogoComune;

  /// No description provided for @heroImageSemantic.
  ///
  /// In it, this message translates to:
  /// **'Immagine ufficiale del Comune di Marcianise'**
  String get heroImageSemantic;

  /// No description provided for @heroTaglinePrefix.
  ///
  /// In it, this message translates to:
  /// **'Marcianise '**
  String get heroTaglinePrefix;

  /// No description provided for @heroTaglineEmphasis.
  ///
  /// In it, this message translates to:
  /// **'digitale'**
  String get heroTaglineEmphasis;

  /// No description provided for @heroTaglineSuffix.
  ///
  /// In it, this message translates to:
  /// **' - servizi e notizie sempre con te'**
  String get heroTaglineSuffix;

  /// No description provided for @drawerFooterPhone.
  ///
  /// In it, this message translates to:
  /// **'Tel: {phone}'**
  String drawerFooterPhone(Object phone);

  /// No description provided for @drawerFooterCopyright.
  ///
  /// In it, this message translates to:
  /// **'© {year} {comune}'**
  String drawerFooterCopyright(Object year, Object comune);

  /// No description provided for @messageDetailComingSoon.
  ///
  /// In it, this message translates to:
  /// **'Dettaglio \"{item}\" - funzionalità in arrivo!'**
  String messageDetailComingSoon(Object item);

  /// No description provided for @messageBackOfficeEdit.
  ///
  /// In it, this message translates to:
  /// **'Modifica \"{item}\" - collegare al back office'**
  String messageBackOfficeEdit(Object item);

  /// No description provided for @messageBackOfficeDelete.
  ///
  /// In it, this message translates to:
  /// **'Eliminazione \"{item}\" - collegare al back office'**
  String messageBackOfficeDelete(Object item);

  /// No description provided for @messageBackOfficeImagesUpload.
  ///
  /// In it, this message translates to:
  /// **'Upload immagini sarà gestito dal back office'**
  String get messageBackOfficeImagesUpload;

  /// No description provided for @messageBackOfficeVideoUpload.
  ///
  /// In it, this message translates to:
  /// **'Upload video sarà gestito dal back office'**
  String get messageBackOfficeVideoUpload;

  /// No description provided for @messageOpenServiceComingSoon.
  ///
  /// In it, this message translates to:
  /// **'Apertura \"{service}\" - integrazione browser in arrivo!'**
  String messageOpenServiceComingSoon(Object service);

  /// No description provided for @messageBookingComingSoon.
  ///
  /// In it, this message translates to:
  /// **'Prenotazione per \"{office}\" - funzionalità in arrivo!'**
  String messageBookingComingSoon(Object office);

  /// No description provided for @messagePagopaComingSoon.
  ///
  /// In it, this message translates to:
  /// **'Integrazione PagoPA in arrivo...'**
  String get messagePagopaComingSoon;

  /// No description provided for @messageNotificationsComingSoon.
  ///
  /// In it, this message translates to:
  /// **'Notifiche push in arrivo con il back office!'**
  String get messageNotificationsComingSoon;

  /// No description provided for @messageSelectLocationGps.
  ///
  /// In it, this message translates to:
  /// **'Seleziona posizione sulla mappa (collegare GPS)'**
  String get messageSelectLocationGps;

  /// No description provided for @messageNewsCreated.
  ///
  /// In it, this message translates to:
  /// **'Notizia creata (collegare al back office)'**
  String get messageNewsCreated;

  /// No description provided for @messageEventCreated.
  ///
  /// In it, this message translates to:
  /// **'Evento creato (collegare al back office)'**
  String get messageEventCreated;

  /// No description provided for @messagePoiCreated.
  ///
  /// In it, this message translates to:
  /// **'POI creato (collegare al back office)'**
  String get messagePoiCreated;

  /// No description provided for @messageScolasticoCreated.
  ///
  /// In it, this message translates to:
  /// **'Servizio aggiunto (collegare al back office)'**
  String get messageScolasticoCreated;

  /// No description provided for @messageComunicatoCreated.
  ///
  /// In it, this message translates to:
  /// **'Comunicato inserito (collegare al back office)'**
  String get messageComunicatoCreated;

  /// No description provided for @messageDisservizioSent.
  ///
  /// In it, this message translates to:
  /// **'Segnalazione inviata con successo!'**
  String get messageDisservizioSent;

  /// No description provided for @messageFilterByDateComingSoon.
  ///
  /// In it, this message translates to:
  /// **'Filtro per data - funzionalità in arrivo!'**
  String get messageFilterByDateComingSoon;

  /// No description provided for @newsFormTitle.
  ///
  /// In it, this message translates to:
  /// **'Crea Notizia'**
  String get newsFormTitle;

  /// No description provided for @newsFormTitleLabel.
  ///
  /// In it, this message translates to:
  /// **'Titolo della notizia'**
  String get newsFormTitleLabel;

  /// No description provided for @newsFormContentLabel.
  ///
  /// In it, this message translates to:
  /// **'Contenuto della notizia'**
  String get newsFormContentLabel;

  /// No description provided for @newsFormCriticalityTitle.
  ///
  /// In it, this message translates to:
  /// **'Criticità'**
  String get newsFormCriticalityTitle;

  /// No description provided for @criticalityLow.
  ///
  /// In it, this message translates to:
  /// **'Bassa'**
  String get criticalityLow;

  /// No description provided for @criticalityMedium.
  ///
  /// In it, this message translates to:
  /// **'Media'**
  String get criticalityMedium;

  /// No description provided for @criticalityHigh.
  ///
  /// In it, this message translates to:
  /// **'Alta'**
  String get criticalityHigh;

  /// No description provided for @newsFormNotificationInfo.
  ///
  /// In it, this message translates to:
  /// **'La notifica push verrà inviata automaticamente in base alla criticità selezionata.'**
  String get newsFormNotificationInfo;

  /// No description provided for @newsFormSubmit.
  ///
  /// In it, this message translates to:
  /// **'Pubblica Notizia'**
  String get newsFormSubmit;

  /// No description provided for @eventFormTitle.
  ///
  /// In it, this message translates to:
  /// **'Crea Nuovo Evento'**
  String get eventFormTitle;

  /// No description provided for @eventFormTitleLabel.
  ///
  /// In it, this message translates to:
  /// **'Titolo dell\'evento'**
  String get eventFormTitleLabel;

  /// No description provided for @eventFormContentLabel.
  ///
  /// In it, this message translates to:
  /// **'Contenuto / Descrizione'**
  String get eventFormContentLabel;

  /// No description provided for @eventFormDateLabel.
  ///
  /// In it, this message translates to:
  /// **'Data evento'**
  String get eventFormDateLabel;

  /// No description provided for @eventFormDateHint.
  ///
  /// In it, this message translates to:
  /// **'GG/MM/AAAA'**
  String get eventFormDateHint;

  /// No description provided for @eventFormGeoTitle.
  ///
  /// In it, this message translates to:
  /// **'Geolocalizzazione'**
  String get eventFormGeoTitle;

  /// No description provided for @eventFormGeoHint.
  ///
  /// In it, this message translates to:
  /// **'Tocca per selezionare posizione'**
  String get eventFormGeoHint;

  /// No description provided for @eventFormSubmit.
  ///
  /// In it, this message translates to:
  /// **'Crea Evento'**
  String get eventFormSubmit;

  /// No description provided for @poiFormTitle.
  ///
  /// In it, this message translates to:
  /// **'Crea Nuovo POI'**
  String get poiFormTitle;

  /// No description provided for @poiFormNameLabel.
  ///
  /// In it, this message translates to:
  /// **'Nome del punto di interesse'**
  String get poiFormNameLabel;

  /// No description provided for @poiFormDescriptionLabel.
  ///
  /// In it, this message translates to:
  /// **'Descrizione'**
  String get poiFormDescriptionLabel;

  /// No description provided for @poiFormGeoTitle.
  ///
  /// In it, this message translates to:
  /// **'Geolocalizzazione'**
  String get poiFormGeoTitle;

  /// No description provided for @poiFormGeoHint.
  ///
  /// In it, this message translates to:
  /// **'Tocca per selezionare posizione'**
  String get poiFormGeoHint;

  /// No description provided for @poiFormSubmit.
  ///
  /// In it, this message translates to:
  /// **'Salva POI'**
  String get poiFormSubmit;

  /// No description provided for @scolasticoFormTitle.
  ///
  /// In it, this message translates to:
  /// **'Aggiungi Servizio Scolastico'**
  String get scolasticoFormTitle;

  /// No description provided for @scolasticoFormNameLabel.
  ///
  /// In it, this message translates to:
  /// **'Nome del servizio'**
  String get scolasticoFormNameLabel;

  /// No description provided for @scolasticoFormDescriptionLabel.
  ///
  /// In it, this message translates to:
  /// **'Descrizione del servizio'**
  String get scolasticoFormDescriptionLabel;

  /// No description provided for @scolasticoFormSubmit.
  ///
  /// In it, this message translates to:
  /// **'Salva Servizio'**
  String get scolasticoFormSubmit;

  /// No description provided for @contactHeaderTitle.
  ///
  /// In it, this message translates to:
  /// **'Contatta gli uffici'**
  String get contactHeaderTitle;

  /// No description provided for @contactHeaderSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Trova i contatti di tutti gli uffici comunali.'**
  String get contactHeaderSubtitle;

  /// No description provided for @contactMunicipioTitle.
  ///
  /// In it, this message translates to:
  /// **'Sede Municipale'**
  String get contactMunicipioTitle;

  /// No description provided for @contactPecLabel.
  ///
  /// In it, this message translates to:
  /// **'PEC: {pec}'**
  String contactPecLabel(Object pec);

  /// No description provided for @contactOfficeCentralino.
  ///
  /// In it, this message translates to:
  /// **'Centralino'**
  String get contactOfficeCentralino;

  /// No description provided for @contactOfficeCentralinoHours.
  ///
  /// In it, this message translates to:
  /// **'Lun-Ven: 8:30 - 14:00'**
  String get contactOfficeCentralinoHours;

  /// No description provided for @contactOfficeAnagrafe.
  ///
  /// In it, this message translates to:
  /// **'Ufficio Anagrafe'**
  String get contactOfficeAnagrafe;

  /// No description provided for @contactOfficeAnagrafeHours.
  ///
  /// In it, this message translates to:
  /// **'Lun-Ven: 9:00 - 13:00'**
  String get contactOfficeAnagrafeHours;

  /// No description provided for @contactOfficeTributi.
  ///
  /// In it, this message translates to:
  /// **'Ufficio Tributi'**
  String get contactOfficeTributi;

  /// No description provided for @contactOfficeTributiHours.
  ///
  /// In it, this message translates to:
  /// **'Lun-Ven: 9:00 - 12:00 | Mar-Gio: 15:00 - 17:00'**
  String get contactOfficeTributiHours;

  /// No description provided for @contactOfficePolizia.
  ///
  /// In it, this message translates to:
  /// **'Polizia Municipale'**
  String get contactOfficePolizia;

  /// No description provided for @contactOfficePoliziaHours.
  ///
  /// In it, this message translates to:
  /// **'Lun-Dom: 8:00 - 20:00'**
  String get contactOfficePoliziaHours;

  /// No description provided for @contactOfficeTecnico.
  ///
  /// In it, this message translates to:
  /// **'Ufficio Tecnico'**
  String get contactOfficeTecnico;

  /// No description provided for @contactOfficeTecnicoHours.
  ///
  /// In it, this message translates to:
  /// **'Lun-Ven: 9:00 - 13:00'**
  String get contactOfficeTecnicoHours;

  /// No description provided for @prenotaHeaderTitle.
  ///
  /// In it, this message translates to:
  /// **'Prenota un appuntamento'**
  String get prenotaHeaderTitle;

  /// No description provided for @prenotaHeaderSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Seleziona l\'ufficio e prenota comodamente il tuo appuntamento.'**
  String get prenotaHeaderSubtitle;

  /// No description provided for @prenotaSelectOfficeTitle.
  ///
  /// In it, this message translates to:
  /// **'Seleziona Ufficio'**
  String get prenotaSelectOfficeTitle;

  /// No description provided for @prenotaOfficeAnagrafeTitle.
  ///
  /// In it, this message translates to:
  /// **'Anagrafe e Stato Civile'**
  String get prenotaOfficeAnagrafeTitle;

  /// No description provided for @prenotaOfficeAnagrafeLocation.
  ///
  /// In it, this message translates to:
  /// **'Via Roma, 18 - Piano Terra'**
  String get prenotaOfficeAnagrafeLocation;

  /// No description provided for @prenotaOfficeAnagrafeHours.
  ///
  /// In it, this message translates to:
  /// **'Lun-Ven: 9:00-13:00'**
  String get prenotaOfficeAnagrafeHours;

  /// No description provided for @prenotaOfficeTributiTitle.
  ///
  /// In it, this message translates to:
  /// **'Ufficio Tributi (IMU/TARI)'**
  String get prenotaOfficeTributiTitle;

  /// No description provided for @prenotaOfficeTributiLocation.
  ///
  /// In it, this message translates to:
  /// **'Via Roma, 18 - Piano 1'**
  String get prenotaOfficeTributiLocation;

  /// No description provided for @prenotaOfficeTributiHours.
  ///
  /// In it, this message translates to:
  /// **'Lun-Ven: 9:00-12:00 | Mar-Gio: 15:00-17:00'**
  String get prenotaOfficeTributiHours;

  /// No description provided for @prenotaOfficeTecnicoTitle.
  ///
  /// In it, this message translates to:
  /// **'Ufficio Tecnico - Edilizia'**
  String get prenotaOfficeTecnicoTitle;

  /// No description provided for @prenotaOfficeTecnicoLocation.
  ///
  /// In it, this message translates to:
  /// **'Via Roma, 18 - Piano 2'**
  String get prenotaOfficeTecnicoLocation;

  /// No description provided for @prenotaOfficeTecnicoHours.
  ///
  /// In it, this message translates to:
  /// **'Lun-Ven: 9:00-13:00'**
  String get prenotaOfficeTecnicoHours;

  /// No description provided for @prenotaOfficeUrpTitle.
  ///
  /// In it, this message translates to:
  /// **'URP - Relazioni con il Pubblico'**
  String get prenotaOfficeUrpTitle;

  /// No description provided for @prenotaOfficeUrpLocation.
  ///
  /// In it, this message translates to:
  /// **'Via Roma, 18 - Piano Terra'**
  String get prenotaOfficeUrpLocation;

  /// No description provided for @prenotaOfficeUrpHours.
  ///
  /// In it, this message translates to:
  /// **'Lun-Ven: 8:30-14:00'**
  String get prenotaOfficeUrpHours;

  /// No description provided for @prenotaOfficePoliziaTitle.
  ///
  /// In it, this message translates to:
  /// **'Polizia Municipale'**
  String get prenotaOfficePoliziaTitle;

  /// No description provided for @prenotaOfficePoliziaLocation.
  ///
  /// In it, this message translates to:
  /// **'Via Roma, 18 - Edificio B'**
  String get prenotaOfficePoliziaLocation;

  /// No description provided for @prenotaOfficePoliziaHours.
  ///
  /// In it, this message translates to:
  /// **'Lun-Dom: 8:00-20:00'**
  String get prenotaOfficePoliziaHours;

  /// No description provided for @prenotaOfficeServiziSocialiTitle.
  ///
  /// In it, this message translates to:
  /// **'Servizi Sociali'**
  String get prenotaOfficeServiziSocialiTitle;

  /// No description provided for @prenotaOfficeServiziSocialiLocation.
  ///
  /// In it, this message translates to:
  /// **'Via Roma, 18 - Piano 1'**
  String get prenotaOfficeServiziSocialiLocation;

  /// No description provided for @prenotaOfficeServiziSocialiHours.
  ///
  /// In it, this message translates to:
  /// **'Lun-Ven: 9:00-13:00'**
  String get prenotaOfficeServiziSocialiHours;

  /// No description provided for @disservizioHeaderTitle.
  ///
  /// In it, this message translates to:
  /// **'Segnala un disservizio'**
  String get disservizioHeaderTitle;

  /// No description provided for @disservizioHeaderSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Hai notato un problema nella tua città? Segnalalo qui e il comune provvederà a risolverlo.'**
  String get disservizioHeaderSubtitle;

  /// No description provided for @disservizioFieldCategoryLabel.
  ///
  /// In it, this message translates to:
  /// **'Categoria'**
  String get disservizioFieldCategoryLabel;

  /// No description provided for @disservizioFieldCategoryHint.
  ///
  /// In it, this message translates to:
  /// **'Seleziona categoria'**
  String get disservizioFieldCategoryHint;

  /// No description provided for @disservizioFieldTitleLabel.
  ///
  /// In it, this message translates to:
  /// **'Titolo'**
  String get disservizioFieldTitleLabel;

  /// No description provided for @disservizioFieldTitleHint.
  ///
  /// In it, this message translates to:
  /// **'Descrivi brevemente il problema'**
  String get disservizioFieldTitleHint;

  /// No description provided for @disservizioFieldDescriptionLabel.
  ///
  /// In it, this message translates to:
  /// **'Descrizione'**
  String get disservizioFieldDescriptionLabel;

  /// No description provided for @disservizioFieldDescriptionHint.
  ///
  /// In it, this message translates to:
  /// **'Descrivi il disservizio in dettaglio...'**
  String get disservizioFieldDescriptionHint;

  /// No description provided for @disservizioFieldAddressLabel.
  ///
  /// In it, this message translates to:
  /// **'Indirizzo'**
  String get disservizioFieldAddressLabel;

  /// No description provided for @disservizioFieldAddressHint.
  ///
  /// In it, this message translates to:
  /// **'Dove si trova il problema?'**
  String get disservizioFieldAddressHint;

  /// No description provided for @disservizioAddPhoto.
  ///
  /// In it, this message translates to:
  /// **'Aggiungi foto'**
  String get disservizioAddPhoto;

  /// No description provided for @disservizioSubmit.
  ///
  /// In it, this message translates to:
  /// **'Invia Segnalazione'**
  String get disservizioSubmit;

  /// No description provided for @rifiutiHeaderTitle.
  ///
  /// In it, this message translates to:
  /// **'Gestione dei rifiuti'**
  String get rifiutiHeaderTitle;

  /// No description provided for @rifiutiHeaderSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Consulta il calendario della raccolta differenziata e le informazioni utili.'**
  String get rifiutiHeaderSubtitle;

  /// No description provided for @rifiutiScheduleTitle.
  ///
  /// In it, this message translates to:
  /// **'Calendario Raccolta'**
  String get rifiutiScheduleTitle;

  /// No description provided for @rifiutiDayMonday.
  ///
  /// In it, this message translates to:
  /// **'Lunedì'**
  String get rifiutiDayMonday;

  /// No description provided for @rifiutiDayTuesday.
  ///
  /// In it, this message translates to:
  /// **'Martedì'**
  String get rifiutiDayTuesday;

  /// No description provided for @rifiutiDayWednesday.
  ///
  /// In it, this message translates to:
  /// **'Mercoledì'**
  String get rifiutiDayWednesday;

  /// No description provided for @rifiutiDayThursday.
  ///
  /// In it, this message translates to:
  /// **'Giovedì'**
  String get rifiutiDayThursday;

  /// No description provided for @rifiutiDayFriday.
  ///
  /// In it, this message translates to:
  /// **'Venerdì'**
  String get rifiutiDayFriday;

  /// No description provided for @rifiutiDaySaturday.
  ///
  /// In it, this message translates to:
  /// **'Sabato'**
  String get rifiutiDaySaturday;

  /// No description provided for @rifiutiTypeOrganico.
  ///
  /// In it, this message translates to:
  /// **'Organico'**
  String get rifiutiTypeOrganico;

  /// No description provided for @rifiutiTypePlasticaMetalli.
  ///
  /// In it, this message translates to:
  /// **'Plastica e Metalli'**
  String get rifiutiTypePlasticaMetalli;

  /// No description provided for @rifiutiTypeIndifferenziata.
  ///
  /// In it, this message translates to:
  /// **'Indifferenziata'**
  String get rifiutiTypeIndifferenziata;

  /// No description provided for @rifiutiTypeCartaCartone.
  ///
  /// In it, this message translates to:
  /// **'Carta e Cartone'**
  String get rifiutiTypeCartaCartone;

  /// No description provided for @rifiutiTypeVetro.
  ///
  /// In it, this message translates to:
  /// **'Vetro'**
  String get rifiutiTypeVetro;

  /// No description provided for @rifiutiCenterTitle.
  ///
  /// In it, this message translates to:
  /// **'Centro Raccolta'**
  String get rifiutiCenterTitle;

  /// No description provided for @rifiutiCenterName.
  ///
  /// In it, this message translates to:
  /// **'Centro Raccolta Comunale'**
  String get rifiutiCenterName;

  /// No description provided for @rifiutiCenterAddress.
  ///
  /// In it, this message translates to:
  /// **'Zona Industriale - Marcianise (CE)'**
  String get rifiutiCenterAddress;

  /// No description provided for @rifiutiCenterHours.
  ///
  /// In it, this message translates to:
  /// **'Orari: Lun-Sab 8:00 - 13:00 | Mar-Gio 15:00 - 18:00'**
  String get rifiutiCenterHours;

  /// No description provided for @culturaHeaderTitle.
  ///
  /// In it, this message translates to:
  /// **'Scopri Marcianise'**
  String get culturaHeaderTitle;

  /// No description provided for @culturaHeaderSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Il patrimonio culturale, i luoghi da visitare e le strutture del territorio.'**
  String get culturaHeaderSubtitle;

  /// No description provided for @culturaCategoryChieseTitle.
  ///
  /// In it, this message translates to:
  /// **'Chiese e Siti Religiosi'**
  String get culturaCategoryChieseTitle;

  /// No description provided for @culturaCategoryChieseDesc.
  ///
  /// In it, this message translates to:
  /// **'Duomo di San Michele Arcangelo, Chiesa dell\'Annunziata, Chiesa di San Carlo Borromeo e altri luoghi di culto.'**
  String get culturaCategoryChieseDesc;

  /// No description provided for @culturaCategoryMonumentiTitle.
  ///
  /// In it, this message translates to:
  /// **'Monumenti e Piazze'**
  String get culturaCategoryMonumentiTitle;

  /// No description provided for @culturaCategoryMonumentiDesc.
  ///
  /// In it, this message translates to:
  /// **'Palazzo Municipale, Piazza Umberto I, Fontana monumentale, Monumento ai Caduti.'**
  String get culturaCategoryMonumentiDesc;

  /// No description provided for @culturaCategoryBibliotecaTitle.
  ///
  /// In it, this message translates to:
  /// **'Biblioteca Comunale'**
  String get culturaCategoryBibliotecaTitle;

  /// No description provided for @culturaCategoryBibliotecaDesc.
  ///
  /// In it, this message translates to:
  /// **'Servizi di prestito, consultazione, sala studio e attività culturali. Orari: Lun-Ven 9:00 - 13:00 / 15:00 - 18:00.'**
  String get culturaCategoryBibliotecaDesc;

  /// No description provided for @culturaCategoryParcheggiTitle.
  ///
  /// In it, this message translates to:
  /// **'Parcheggi Pubblici'**
  String get culturaCategoryParcheggiTitle;

  /// No description provided for @culturaCategoryParcheggiDesc.
  ///
  /// In it, this message translates to:
  /// **'Informazioni su disponibilità, gratuità e regolamentazioni dei parcheggi comunali.'**
  String get culturaCategoryParcheggiDesc;

  /// No description provided for @culturaCategorySportTitle.
  ///
  /// In it, this message translates to:
  /// **'Impianti Sportivi'**
  String get culturaCategorySportTitle;

  /// No description provided for @culturaCategorySportDesc.
  ///
  /// In it, this message translates to:
  /// **'Stadio Comunale, Palazzetto dello Sport, campi da tennis, piscina comunale e altre strutture.'**
  String get culturaCategorySportDesc;

  /// No description provided for @culturaCategoryParchiTitle.
  ///
  /// In it, this message translates to:
  /// **'Parchi e Aree Verdi'**
  String get culturaCategoryParchiTitle;

  /// No description provided for @culturaCategoryParchiDesc.
  ///
  /// In it, this message translates to:
  /// **'Parco Comunale, Villa Comunale, aree gioco e percorsi verdi per famiglie.'**
  String get culturaCategoryParchiDesc;

  /// No description provided for @culturaBackOfficeNote.
  ///
  /// In it, this message translates to:
  /// **'Contenuti gestiti dal back office comunale. Le informazioni verranno aggiornate dagli operatori.'**
  String get culturaBackOfficeNote;

  /// No description provided for @consiglioRecentVideosTitle.
  ///
  /// In it, this message translates to:
  /// **'Video Recenti'**
  String get consiglioRecentVideosTitle;

  /// No description provided for @consiglioPreviousSessionsTitle.
  ///
  /// In it, this message translates to:
  /// **'Sedute Precedenti'**
  String get consiglioPreviousSessionsTitle;

  /// No description provided for @consiglioHighlightTitle.
  ///
  /// In it, this message translates to:
  /// **'Consiglio Comunale: Approvato il nuovo piano urbanistico'**
  String get consiglioHighlightTitle;

  /// No description provided for @consiglioHighlightSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Si è conclusa ieri sera la seduta del consiglio comunale con l\'approvazione del nuovo piano urbanistico.'**
  String get consiglioHighlightSubtitle;

  /// No description provided for @consiglioSessionTitle.
  ///
  /// In it, this message translates to:
  /// **'Seduta Straordinaria:\nBilancio di Previsioni {year}'**
  String consiglioSessionTitle(Object year);

  /// No description provided for @sindacoHeaderTitle.
  ///
  /// In it, this message translates to:
  /// **'Comunicazioni del Sindaco'**
  String get sindacoHeaderTitle;

  /// No description provided for @sindacoHeaderSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Immagini, video e comunicati ufficiali del Sindaco di Marcianise.'**
  String get sindacoHeaderSubtitle;

  /// No description provided for @sindacoSectionImagesTitle.
  ///
  /// In it, this message translates to:
  /// **'4.1 Carica Immagini'**
  String get sindacoSectionImagesTitle;

  /// No description provided for @sindacoSectionImagesDesc.
  ///
  /// In it, this message translates to:
  /// **'Galleria fotografica del sindaco: eventi istituzionali, inaugurazioni e visite.'**
  String get sindacoSectionImagesDesc;

  /// No description provided for @sindacoSectionVideoTitle.
  ///
  /// In it, this message translates to:
  /// **'4.2 Carica Video'**
  String get sindacoSectionVideoTitle;

  /// No description provided for @sindacoSectionVideoDesc.
  ///
  /// In it, this message translates to:
  /// **'Videomessaggi e dichiarazioni ufficiali del sindaco alla cittadinanza.'**
  String get sindacoSectionVideoDesc;

  /// No description provided for @sindacoSectionComunicatiTitle.
  ///
  /// In it, this message translates to:
  /// **'4.3 Inserisci Comunicati'**
  String get sindacoSectionComunicatiTitle;

  /// No description provided for @sindacoSectionComunicatiDesc.
  ///
  /// In it, this message translates to:
  /// **'Comunicati stampa ufficiali, ordinanze e avvisi del sindaco.'**
  String get sindacoSectionComunicatiDesc;

  /// No description provided for @sindacoLatestTitle.
  ///
  /// In it, this message translates to:
  /// **'Ultimi Comunicati'**
  String get sindacoLatestTitle;

  /// No description provided for @sindacoComunicato1Title.
  ///
  /// In it, this message translates to:
  /// **'Ordinanza pulizia straordinaria centro storico'**
  String get sindacoComunicato1Title;

  /// No description provided for @sindacoComunicato1Date.
  ///
  /// In it, this message translates to:
  /// **'5 Febbraio 2026'**
  String get sindacoComunicato1Date;

  /// No description provided for @sindacoComunicato1Content.
  ///
  /// In it, this message translates to:
  /// **'Il sindaco ordina interventi di pulizia straordinaria nel centro storico a partire dal 10 febbraio.'**
  String get sindacoComunicato1Content;

  /// No description provided for @sindacoComunicato2Title.
  ///
  /// In it, this message translates to:
  /// **'Auguri di buon anno alla cittadinanza'**
  String get sindacoComunicato2Title;

  /// No description provided for @sindacoComunicato2Date.
  ///
  /// In it, this message translates to:
  /// **'1 Gennaio 2026'**
  String get sindacoComunicato2Date;

  /// No description provided for @sindacoComunicato2Content.
  ///
  /// In it, this message translates to:
  /// **'Cari concittadini, è con grande piacere che vi porgo i miei auguri per un sereno e prospero anno nuovo.'**
  String get sindacoComunicato2Content;

  /// No description provided for @sindacoComunicato3Title.
  ///
  /// In it, this message translates to:
  /// **'Aggiornamento lavori pubblici Via Roma'**
  String get sindacoComunicato3Title;

  /// No description provided for @sindacoComunicato3Date.
  ///
  /// In it, this message translates to:
  /// **'20 Dicembre 2025'**
  String get sindacoComunicato3Date;

  /// No description provided for @sindacoComunicato3Content.
  ///
  /// In it, this message translates to:
  /// **'Vi informo che i lavori di riqualificazione di Via Roma procedono secondo i tempi previsti.'**
  String get sindacoComunicato3Content;

  /// No description provided for @sindacoFormImagesTitle.
  ///
  /// In it, this message translates to:
  /// **'Carica Immagini'**
  String get sindacoFormImagesTitle;

  /// No description provided for @sindacoFormImagesHint.
  ///
  /// In it, this message translates to:
  /// **'Tocca per selezionare immagini'**
  String get sindacoFormImagesHint;

  /// No description provided for @sindacoFormVideoTitle.
  ///
  /// In it, this message translates to:
  /// **'Carica Video'**
  String get sindacoFormVideoTitle;

  /// No description provided for @sindacoFormVideoHint.
  ///
  /// In it, this message translates to:
  /// **'Tocca per selezionare un video'**
  String get sindacoFormVideoHint;

  /// No description provided for @sindacoFormComunicatoTitle.
  ///
  /// In it, this message translates to:
  /// **'Nuovo Comunicato'**
  String get sindacoFormComunicatoTitle;

  /// No description provided for @sindacoFormComunicatoTitleLabel.
  ///
  /// In it, this message translates to:
  /// **'Titolo del comunicato'**
  String get sindacoFormComunicatoTitleLabel;

  /// No description provided for @sindacoFormComunicatoContentLabel.
  ///
  /// In it, this message translates to:
  /// **'Contenuto del comunicato'**
  String get sindacoFormComunicatoContentLabel;

  /// No description provided for @sindacoFormComunicatoSubmit.
  ///
  /// In it, this message translates to:
  /// **'Pubblica Comunicato'**
  String get sindacoFormComunicatoSubmit;

  /// No description provided for @tributiHeaderTitle.
  ///
  /// In it, this message translates to:
  /// **'I tuoi pagamenti'**
  String get tributiHeaderTitle;

  /// No description provided for @tributiHeaderSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Consulta le scadenze, effettua pagamenti e visualizza lo storico delle transazioni.'**
  String get tributiHeaderSubtitle;

  /// No description provided for @tributiSectionAvailableTitle.
  ///
  /// In it, this message translates to:
  /// **'Tributi comunali'**
  String get tributiSectionAvailableTitle;

  /// No description provided for @tributiImuTitle.
  ///
  /// In it, this message translates to:
  /// **'IMU - Imposta Municipale'**
  String get tributiImuTitle;

  /// No description provided for @tributiImuDue.
  ///
  /// In it, this message translates to:
  /// **'Scadenza: 16 Giugno 2026'**
  String get tributiImuDue;

  /// No description provided for @tributiTariTitle.
  ///
  /// In it, this message translates to:
  /// **'TARI - Tassa Rifiuti'**
  String get tributiTariTitle;

  /// No description provided for @tributiTariDue.
  ///
  /// In it, this message translates to:
  /// **'Scadenza: 30 Aprile 2026'**
  String get tributiTariDue;

  /// No description provided for @tributiCanoneIdricoTitle.
  ///
  /// In it, this message translates to:
  /// **'Canone Idrico'**
  String get tributiCanoneIdricoTitle;

  /// No description provided for @tributiCanoneIdricoDue.
  ///
  /// In it, this message translates to:
  /// **'Scadenza: 31 Marzo 2026'**
  String get tributiCanoneIdricoDue;

  /// No description provided for @tributiServiziScolasticiTitle.
  ///
  /// In it, this message translates to:
  /// **'Servizi Scolastici'**
  String get tributiServiziScolasticiTitle;

  /// No description provided for @tributiServiziScolasticiDetail.
  ///
  /// In it, this message translates to:
  /// **'Mensa, trasporto, pre/post scuola'**
  String get tributiServiziScolasticiDetail;

  /// No description provided for @tributiAmountPending.
  ///
  /// In it, this message translates to:
  /// **'€ ---'**
  String get tributiAmountPending;

  /// No description provided for @tributiSectionHistoryTitle.
  ///
  /// In it, this message translates to:
  /// **'Storico pagamenti'**
  String get tributiSectionHistoryTitle;

  /// No description provided for @tributiHistoryTariTitle.
  ///
  /// In it, this message translates to:
  /// **'TARI 2025 - Rata unica'**
  String get tributiHistoryTariTitle;

  /// No description provided for @tributiHistoryTariDate.
  ///
  /// In it, this message translates to:
  /// **'15 Dic 2025'**
  String get tributiHistoryTariDate;

  /// No description provided for @tributiHistoryTariAmount.
  ///
  /// In it, this message translates to:
  /// **'€ 280,00'**
  String get tributiHistoryTariAmount;

  /// No description provided for @tributiHistoryImuTitle.
  ///
  /// In it, this message translates to:
  /// **'IMU 2025 - Saldo'**
  String get tributiHistoryImuTitle;

  /// No description provided for @tributiHistoryImuDate.
  ///
  /// In it, this message translates to:
  /// **'16 Dic 2025'**
  String get tributiHistoryImuDate;

  /// No description provided for @tributiHistoryImuAmount.
  ///
  /// In it, this message translates to:
  /// **'€ 450,00'**
  String get tributiHistoryImuAmount;

  /// No description provided for @tributiPagopaTitle.
  ///
  /// In it, this message translates to:
  /// **'Paga online in sicurezza'**
  String get tributiPagopaTitle;

  /// No description provided for @tributiPagopaSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Effettua pagamenti di tributi, multe e servizi comunali tramite la piattaforma certificata PagoPA.'**
  String get tributiPagopaSubtitle;

  /// No description provided for @tributiPagopaNote.
  ///
  /// In it, this message translates to:
  /// **'I pagamenti sono gestiti tramite la piattaforma PagoPA in conformità con le normative nazionali.'**
  String get tributiPagopaNote;

  /// No description provided for @serviziOnlineAnprTitle.
  ///
  /// In it, this message translates to:
  /// **'ANPR - Sportello del Cittadino'**
  String get serviziOnlineAnprTitle;

  /// No description provided for @serviziOnlineAnprDesc.
  ///
  /// In it, this message translates to:
  /// **'Anagrafe Nazionale Popolazione Residente: certificati, cambio residenza.'**
  String get serviziOnlineAnprDesc;

  /// No description provided for @serviziOnlinePagopaTitle.
  ///
  /// In it, this message translates to:
  /// **'Pagamenti Online (PagoPA)'**
  String get serviziOnlinePagopaTitle;

  /// No description provided for @serviziOnlinePagopaDesc.
  ///
  /// In it, this message translates to:
  /// **'Paga tributi, IMU, TARI, multe e servizi comunali online.'**
  String get serviziOnlinePagopaDesc;

  /// No description provided for @serviziOnlineImuTariTitle.
  ///
  /// In it, this message translates to:
  /// **'Sportello Telematico IMU e TARI'**
  String get serviziOnlineImuTariTitle;

  /// No description provided for @serviziOnlineImuTariDesc.
  ///
  /// In it, this message translates to:
  /// **'Dichiarazioni, calcolo e gestione IMU e TARI online.'**
  String get serviziOnlineImuTariDesc;

  /// No description provided for @serviziOnlineSuapTitle.
  ///
  /// In it, this message translates to:
  /// **'SUAP - Attività Produttive'**
  String get serviziOnlineSuapTitle;

  /// No description provided for @serviziOnlineSuapDesc.
  ///
  /// In it, this message translates to:
  /// **'Sportello Unico Attività Produttive su impresainungiorno.gov.it.'**
  String get serviziOnlineSuapDesc;

  /// No description provided for @serviziOnlineSueTitle.
  ///
  /// In it, this message translates to:
  /// **'SUE - Sportello Unico Edilizia'**
  String get serviziOnlineSueTitle;

  /// No description provided for @serviziOnlineSueDesc.
  ///
  /// In it, this message translates to:
  /// **'Pratiche edilizie e urbanistiche tramite sportello telematico.'**
  String get serviziOnlineSueDesc;

  /// No description provided for @serviziOnlineAlboTitle.
  ///
  /// In it, this message translates to:
  /// **'Albo Pretorio Online'**
  String get serviziOnlineAlboTitle;

  /// No description provided for @serviziOnlineAlboDesc.
  ///
  /// In it, this message translates to:
  /// **'Consulta atti, determine, delibere e ordinanze pubblicate.'**
  String get serviziOnlineAlboDesc;

  /// No description provided for @serviziOnlineTrasparenzaTitle.
  ///
  /// In it, this message translates to:
  /// **'Amministrazione Trasparente'**
  String get serviziOnlineTrasparenzaTitle;

  /// No description provided for @serviziOnlineTrasparenzaDesc.
  ///
  /// In it, this message translates to:
  /// **'Accesso agli atti e alle informazioni sulla PA.'**
  String get serviziOnlineTrasparenzaDesc;

  /// No description provided for @scolasticiHeaderSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Tutti i servizi scolastici offerti dal Comune di Marcianise per le scuole del territorio.'**
  String get scolasticiHeaderSubtitle;

  /// No description provided for @scolasticiBackOfficeInfo.
  ///
  /// In it, this message translates to:
  /// **'I servizi scolastici sono gestiti dal back office comunale. Le modifiche verranno pubblicate dopo approvazione.'**
  String get scolasticiBackOfficeInfo;

  /// No description provided for @scolasticiServiceMensaTitle.
  ///
  /// In it, this message translates to:
  /// **'Mensa Scolastica'**
  String get scolasticiServiceMensaTitle;

  /// No description provided for @scolasticiServiceMensaDesc.
  ///
  /// In it, this message translates to:
  /// **'Servizio di refezione scolastica per le scuole primarie e dell\'infanzia del territorio.'**
  String get scolasticiServiceMensaDesc;

  /// No description provided for @scolasticiServiceTrasportoTitle.
  ///
  /// In it, this message translates to:
  /// **'Trasporto Scolastico'**
  String get scolasticiServiceTrasportoTitle;

  /// No description provided for @scolasticiServiceTrasportoDesc.
  ///
  /// In it, this message translates to:
  /// **'Servizio di trasporto con scuolabus per gli alunni delle scuole comunali.'**
  String get scolasticiServiceTrasportoDesc;

  /// No description provided for @scolasticiServicePrePostTitle.
  ///
  /// In it, this message translates to:
  /// **'Pre-scuola e Post-scuola'**
  String get scolasticiServicePrePostTitle;

  /// No description provided for @scolasticiServicePrePostDesc.
  ///
  /// In it, this message translates to:
  /// **'Servizio di accoglienza anticipata (7:30-8:30) e prolungamento orario (16:00-17:30).'**
  String get scolasticiServicePrePostDesc;

  /// No description provided for @scolasticiServiceAssistenzaTitle.
  ///
  /// In it, this message translates to:
  /// **'Assistenza Alunni Disabili'**
  String get scolasticiServiceAssistenzaTitle;

  /// No description provided for @scolasticiServiceAssistenzaDesc.
  ///
  /// In it, this message translates to:
  /// **'Supporto educativo e assistenziale per alunni con disabilità nelle scuole comunali.'**
  String get scolasticiServiceAssistenzaDesc;

  /// No description provided for @scolasticiServiceCedoleTitle.
  ///
  /// In it, this message translates to:
  /// **'Cedole Librarie'**
  String get scolasticiServiceCedoleTitle;

  /// No description provided for @scolasticiServiceCedoleDesc.
  ///
  /// In it, this message translates to:
  /// **'Distribuzione cedole per la fornitura gratuita dei libri di testo nelle scuole primarie.'**
  String get scolasticiServiceCedoleDesc;

  /// No description provided for @scolasticiServiceCentriTitle.
  ///
  /// In it, this message translates to:
  /// **'Centri Estivi'**
  String get scolasticiServiceCentriTitle;

  /// No description provided for @scolasticiServiceCentriDesc.
  ///
  /// In it, this message translates to:
  /// **'Attività ricreative e sportive per bambini e ragazzi durante il periodo estivo.'**
  String get scolasticiServiceCentriDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
