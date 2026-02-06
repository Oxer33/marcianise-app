/// Modello dati per una notizia/avviso
/// Usato nella sezione News e nella home page
class NewsModel {
  final String id;
  final String titolo;
  final String descrizione;
  final String data;
  final String? immagineUrl;
  final String categoria; // 'news' o 'avviso'
  final bool isUrgente;

  const NewsModel({
    required this.id,
    required this.titolo,
    required this.descrizione,
    required this.data,
    this.immagineUrl,
    required this.categoria,
    this.isUrgente = false,
  });
}
