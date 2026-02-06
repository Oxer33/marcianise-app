/// Modello dati per un evento
/// Usato nella sezione Eventi e nella home page
class EventoModel {
  final String id;
  final String titolo;
  final String descrizione;
  final String data;
  final String ora;
  final String luogo;
  final String? immagineUrl;
  final String categoria; // es. 'Cultura & Musica', 'Sport', ecc.
  final bool isPassato;

  const EventoModel({
    required this.id,
    required this.titolo,
    required this.descrizione,
    required this.data,
    required this.ora,
    required this.luogo,
    this.immagineUrl,
    required this.categoria,
    this.isPassato = false,
  });
}
