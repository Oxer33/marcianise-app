import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'core/constants/app_constants.dart';

/// Punto di ingresso dell'app Comune di Marcianise
/// Configura il tema, il routing e avvia l'applicazione
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Imposta la barra di stato trasparente con icone bianche
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MarcianiseApp());
}

/// Widget root dell'applicazione
/// Configura MaterialApp con tema blu, routing e titolo
class MarcianiseApp extends StatelessWidget {
  const MarcianiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Titolo dell'app
      title: AppConstants.comuneNomeCompleto,

      // Tema blu personalizzato
      theme: AppTheme.lightTheme,

      // Rimuovi banner debug
      debugShowCheckedModeBanner: false,

      // Rotta iniziale
      initialRoute: AppRoutes.home,

      // Router centralizzato
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
