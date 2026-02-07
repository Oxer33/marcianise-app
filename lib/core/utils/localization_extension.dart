import 'package:flutter/material.dart';
import 'package:marcianise_app/l10n/app_localizations.dart';

/// Estensione per accedere rapidamente alle localizzazioni generate.
extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
