import 'package:flutter/material.dart';

/// Modello dati per i Punti di Interesse (POI).
class PoiModel {
  final String nome;
  final String descrizione;
  final IconData icona;
  final String indirizzo;

  const PoiModel({
    required this.nome,
    required this.descrizione,
    required this.icona,
    required this.indirizzo,
  });
}
