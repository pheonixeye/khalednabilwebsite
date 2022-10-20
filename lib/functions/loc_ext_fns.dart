import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/language/app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}
