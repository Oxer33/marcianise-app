/// Definizione delle rotte dell'app
/// Organizzate per moduli come da documento di progetto MTK
class AppRoutes {
  AppRoutes._();

  // === ROTTA PRINCIPALE ===
  static const String home = '/';

  // === MODULO A: Comunicazioni istituzionali e Notizie ===
  static const String newsAvvisi = '/news-avvisi';

  // === MODULO B: Diretta live Consiglio Comunale ===
  static const String consiglioComunale = '/consiglio-comunale';

  // === MODULO C: Eventi, manifestazioni e iniziative ===
  static const String eventi = '/eventi';

  // === MODULO D: Cultura e Turismo ===
  static const String culturaTurismo = '/cultura-turismo';

  // === MODULO E: Tributi e Pagamenti ===
  static const String tributiPagamenti = '/tributi-pagamenti';

  // === SERVIZI AL CITTADINO ===
  static const String segnalaDisservizio = '/segnala-disservizio';
  static const String prenotaUfficio = '/prenota-ufficio';
  static const String contattaUffici = '/contatta-uffici';
  static const String gestioneRifiuti = '/gestione-rifiuti';
  static const String serviziOnline = '/servizi-online';
  static const String luoghiInteresse = '/luoghi-interesse';
}
