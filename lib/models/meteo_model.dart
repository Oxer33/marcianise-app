/// Modello dati per le previsioni meteo
/// Mostrato nella hero section della home page
class MeteoGiornoModel {
  final String giorno;        // es. 'GIO', 'VEN', 'SAB'
  final int tempMax;
  final int tempMin;
  final String condizione;    // es. 'Soleggiato', 'Nuvoloso', 'Pioggia'
  final String icona;         // Nome icona meteo

  const MeteoGiornoModel({
    required this.giorno,
    required this.tempMax,
    required this.tempMin,
    required this.condizione,
    required this.icona,
  });
}
