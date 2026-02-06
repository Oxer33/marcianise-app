import 'package:flutter/material.dart';
import '../models/meteo_model.dart';
import '../core/theme/app_text_styles.dart';
import '../data/mock_data.dart';

/// Widget meteo che mostra le previsioni per i prossimi giorni
/// Posizionato sopra la hero image nella home page
class MeteoWidget extends StatelessWidget {
  const MeteoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const previsioni = MockData.meteo;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: previsioni.asMap().entries.map((entry) {
        final index = entry.key;
        final giorno = entry.value;
        return Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
              // Separatore tra i giorni
              border: index < previsioni.length - 1
                  ? const Border(
                      right: BorderSide(
                        color: Colors.white30,
                        width: 1,
                      ),
                    )
                  : null,
            ),
            child: _buildGiornoMeteo(giorno),
          ),
        );
      }).toList(),
    );
  }

  /// Costruisce la colonna per un singolo giorno meteo
  Widget _buildGiornoMeteo(MeteoGiornoModel giorno) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icona meteo
        Icon(
          _getMeteoIcona(giorno.icona),
          color: Colors.white,
          size: 28,
        ),
        const SizedBox(height: 4),
        // Nome giorno
        Text(giorno.giorno, style: AppTextStyles.weatherDay),
        const SizedBox(height: 2),
        // Temperature
        Text(
          'Max. ${giorno.tempMax}',
          style: AppTextStyles.weatherDetail,
        ),
        Text(
          'Min. ${giorno.tempMin}',
          style: AppTextStyles.weatherDetail,
        ),
      ],
    );
  }

  /// Converte il nome dell'icona meteo in un'IconData di Material
  IconData _getMeteoIcona(String nome) {
    switch (nome) {
      case 'sunny':
        return Icons.wb_sunny_rounded;
      case 'cloud':
        return Icons.cloud_rounded;
      case 'cloud_sun':
        return Icons.wb_cloudy_rounded;
      case 'rain':
        return Icons.water_drop_rounded;
      case 'snow':
        return Icons.ac_unit_rounded;
      case 'storm':
        return Icons.thunderstorm_rounded;
      default:
        return Icons.wb_sunny_rounded;
    }
  }
}
