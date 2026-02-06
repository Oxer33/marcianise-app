import 'package:flutter/material.dart';

/// Modello dati per un servizio nella griglia della home
/// Ogni servizio ha un'icona, un titolo, un colore e una rotta
class ServizioModel {
  final String titolo;
  final IconData icona;
  final Color coloreSfondo;
  final Color coloreIcona;
  final String rotta;

  const ServizioModel({
    required this.titolo,
    required this.icona,
    required this.coloreSfondo,
    required this.coloreIcona,
    required this.rotta,
  });
}
