import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class LocalizationChecker {
  static void changeLanguage(BuildContext context) {
    Locale currentLocal = EasyLocalization.of(context)!.currentLocale!;
    Locale newLocale = currentLocal.languageCode == 'en'
        ? const Locale('hu', 'HU')
        : const Locale('en', 'US');
    EasyLocalization.of(context)!.setLocale(newLocale);
  }
}
