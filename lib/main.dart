import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'package:marcianise_app/l10n/app_localizations.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'core/constants/app_constants.dart';
import 'widgets/responsive_wrapper.dart';
import 'core/utils/localization_extension.dart';

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
/// Configura MaterialApp con tema verde scuro istituzionale, routing e titolo
class MarcianiseApp extends StatelessWidget {
  const MarcianiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Titolo dell'app (localizzato)
      title: AppConstants.comuneNomeCompleto,
      onGenerateTitle: (context) => context.l10n.appName,

      // Tema verde scuro istituzionale personalizzato (light + dark)
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Rimuovi banner debug
      debugShowCheckedModeBanner: false,

      // Rotta iniziale
      initialRoute: AppRoutes.home,

      // Localizzazione
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // Router centralizzato
      onGenerateRoute: AppRouter.generateRoute,

      // Wrapper responsive per tablet/desktop/web
      // Centra il contenuto e limita la larghezza su schermi grandi
      builder: (context, child) {
        return Container(
          // Usa il colore di scaffold del tema corrente per supporto dark mode
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ResponsiveWrapper(child: child ?? const SizedBox()),
        );
      },
    );
  }
}
